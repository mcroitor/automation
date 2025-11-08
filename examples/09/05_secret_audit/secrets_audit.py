import logging
import json
import os
from datetime import datetime

try:
    import hvac
    VAULT_AVAILABLE = True
except ImportError:
    VAULT_AVAILABLE = False
    print("Warning: hvac library not installed. Install with: pip install hvac")

class SecretAuditLogger:
    def __init__(self, log_file="/var/log/secret_access.log"):
        self.logger = logging.getLogger("secret_audit")
        handler = logging.FileHandler(log_file)
        formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
        handler.setFormatter(formatter)
        self.logger.addHandler(handler)
        self.logger.setLevel(logging.INFO)
    
    def log_secret_access(self, user, secret_name, action, success, client_ip=None):
        """Write an audit log entry for secret access"""
        log_entry = {
            "timestamp": datetime.utcnow().isoformat(),
            "user": user,
            "secret_name": secret_name,
            "action": action,  # read, write, delete, rotate
            "success": success,
            "client_ip": client_ip
        }
        
        level = logging.INFO if success else logging.WARNING
        self.logger.log(level, f"SECRET_ACCESS: {json.dumps(log_entry)}")

# Use the SecretAuditLogger
audit_logger = SecretAuditLogger()

# Initialize Vault client
def initialize_vault_client():
    """Initialize Vault client with configuration from environment variables"""
    if not VAULT_AVAILABLE:
        raise ImportError("hvac library is required but not installed")
    
    vault_url = os.getenv('VAULT_URL', 'http://localhost:8200')
    vault_token = os.getenv('VAULT_TOKEN')
    
    if not vault_token:
        raise ValueError("VAULT_TOKEN environment variable is required")
    
    client = hvac.Client(url=vault_url, token=vault_token)
    
    if not client.is_authenticated():
        raise Exception("Failed to authenticate with Vault")
    
    return client

# Initialize vault client
try:
    vault = initialize_vault_client()
except Exception as e:
    print(f"Warning: Could not initialize Vault client: {e}")
    vault = None

def get_secret_with_audit(secret_name, user, client_ip=None):
    """Retrieve a secret with audit logging"""
    if vault is None:
        raise Exception("Vault client is not initialized")
    
    try:
        # Use Vault KV v2 API to get secret
        secret_response = vault.secrets.kv.v2.read_secret_version(path=secret_name)
        secret_data = secret_response['data']['data']
        
        audit_logger.log_secret_access(
            user=user,
            secret_name=secret_name,
            action="read",
            success=True,
            client_ip=client_ip
        )
        return secret_data
    except Exception as e:
        audit_logger.log_secret_access(
            user=user,
            secret_name=secret_name,
            action="read",
            success=False,
            client_ip=client_ip
        )
        raise Exception(f"Could not retrieve secret {secret_name}: {str(e)}")

def put_secret_with_audit(secret_name, secret_data, user, client_ip=None):
    """Store a secret with audit logging"""
    if vault is None:
        raise Exception("Vault client is not initialized")
    
    try:
        # Use Vault KV v2 API to store secret
        vault.secrets.kv.v2.create_or_update_secret(
            path=secret_name,
            secret=secret_data
        )
        
        audit_logger.log_secret_access(
            user=user,
            secret_name=secret_name,
            action="write",
            success=True,
            client_ip=client_ip
        )
    except Exception as e:
        audit_logger.log_secret_access(
            user=user,
            secret_name=secret_name,
            action="write",
            success=False,
            client_ip=client_ip
        )
        raise Exception(f"Could not store secret {secret_name}: {str(e)}")

def delete_secret_with_audit(secret_name, user, client_ip=None):
    """Delete a secret with audit logging"""
    if vault is None:
        raise Exception("Vault client is not initialized")
    
    try:
        # Use Vault KV v2 API to delete secret
        vault.secrets.kv.v2.delete_metadata_and_all_versions(path=secret_name)
        
        audit_logger.log_secret_access(
            user=user,
            secret_name=secret_name,
            action="delete",
            success=True,
            client_ip=client_ip
        )
    except Exception as e:
        audit_logger.log_secret_access(
            user=user,
            secret_name=secret_name,
            action="delete",
            success=False,
            client_ip=client_ip
        )
        raise Exception(f"Could not delete secret {secret_name}: {str(e)}")

# Example usage
if __name__ == "__main__":
    # Example: reading a secret
    try:
        if vault is not None:
            secret_data = get_secret_with_audit(
                secret_name="myapp/database",
                user="automation_user",
                client_ip="192.168.1.100"
            )
            print("Secret retrieved successfully")
        else:
            print("Vault client not available - skipping secret operations")
    except Exception as e:
        print(f"Error: {e}")
    
    # Example: storing a secret
    try:
        if vault is not None:
            put_secret_with_audit(
                secret_name="myapp/api",
                secret_data={"api_key": "secret-api-key-123"},
                user="admin_user",
                client_ip="192.168.1.101"
            )
            print("Secret stored successfully")
    except Exception as e:
        print(f"Error: {e}")
