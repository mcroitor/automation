# Jenkins

- [Jenkins](#jenkins)
  - [Установка Jenkins](#установка-jenkins)
  - [Настройка Jenkins](#настройка-jenkins)
  - [Jenkinsfile](#jenkinsfile)
    - [Декларативный синтаксис](#декларативный-синтаксис)
    - [Скриптовый синтаксис](#скриптовый-синтаксис)
  - [Основы программирования Jenkinsfile](#основы-программирования-jenkinsfile)
    - [Переменные и типы данных](#переменные-и-типы-данных)
    - [Базовые конструкции](#базовые-конструкции)
      - [Условные конструкции](#условные-конструкции)
      - [Циклы](#циклы)
    - [Объявление функций](#объявление-функций)
    - [Встроенные команды и функции](#встроенные-команды-и-функции)
  - [Основы создания конвейеров в Jenkins](#основы-создания-конвейеров-в-jenkins)
    - [Работа с переменными окружения](#работа-с-переменными-окружения)
    - [Параметризация сборки](#параметризация-сборки)
    - [Обработка ошибок и отказоустойчивость](#обработка-ошибок-и-отказоустойчивость)
  - [Пример полного Jenkinsfile для Node.js проекта](#пример-полного-jenkinsfile-для-nodejs-проекта)
  - [Передовые практики](#передовые-практики)
  - [Библиография](#библиография)

## Установка Jenkins

Jenkins можно установить на различные операционные системы, включая Windows, macOS и Linux. Минимальные требования к железу для установки Jenkins:

- **Процессор**: 1 ГГц или выше
- **Оперативная память**: минимум 256 МБ (рекомендуется 4 ГБ или больше)
- **Место на диске**: минимум 1 ГБ (рекомендуется 50 ГБ или больше)

Установка в Linux (на примере Ubuntu):

```bash
sudo apt update
sudo apt install fontconfig openjdk-21-jre
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install jenkins
```

Также существует возможность запуска Jenkins в контейнере Docker, что упрощает процесс установки и настройки. В случае запуска Jenkins в Docker, рекомендуется дополнительно 10 ГБ.

Для установки Jenkins в Docker можно использовать следующий `docker-compose.yml` файл:

```yaml
services:
  jenkins:
    image: jenkins/jenkins:lts
    container_name: jenkins
    ports:
      - "8080:8080"
      - "50000:50000"
    volumes:
      - jenkins_home:/var/jenkins_home
    networks:
      - jenkins-net

volumes:
  jenkins_home:

networks:
  jenkins-net:
    driver: bridge
```

## Настройка Jenkins

После установки Jenkins необходимо выполнить первоначальную настройку. Для этого откройте веб-браузер и перейдите по адресу `http://localhost:8080`. Вам будет предложено ввести пароль установки, который можно найти в файле `/var/jenkins_home/secrets/initialAdminPassword` внутри контейнера Jenkins. При запуске Jenkins в Docker, этот пароль будет доступен в логах контейнера.

После ввода пароля вам будет предложено установить рекомендуемые плагины и создать первого администратора. По умолчанию Jenkins поддерживает работу с GitHub, остальные интеграции можно включить по необходимости.

Начальная установка Jenkins в Docker будет включать в себя работу с Java и Node.js, для остальных языков программирования надо добавлять средства сборки и тестирования.

## Jenkinsfile

`Jenkinsfile` — это текстовый файл, который содержит все этапы и шаги вашего конвейера. Он может быть создан в корне вашего проекта и должен быть добавлен в систему контроля версий. `Jenkinsfile` пишется на языке Groovy и поддерживает два типа синтаксиса: декларативный и скриптовый.

### Декларативный синтаксис

При декларативном синтаксисе `Jenkinsfile` имеет следующую структуру:

```groovy
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                // Шаги для сборки
            }
        }
        stage('Test') {
            steps {
                // Шаги для тестирования
            }
        }
        stage('Deploy') {
            steps {
                // Шаги для развертывания
            }
        }
    }
    post {
        always {
            // Действия, которые выполняются всегда после завершения конвейера
        }
        success {
            // Действия при успешном завершении
        }
        failure {
            // Действия при неудаче
        }
    }
}
```

В этом примере:

- `pipeline` — корневой блок, определяющий конвейер;
- `agent any` — указывает, что конвейер может выполняться на любом доступном агенте Jenkins;
- `stages` — блок, содержащий все этапы конвейера;
- `stage('Stage Name')` — определяет отдельный этап с именем;
- `steps` — блок, содержащий конкретные шаги, которые должны быть выполнены на данном этапе;
- `post` — блок, определяющий действия, которые должны быть выполнены после завершения конвейера, в зависимости от его результата.

### Скриптовый синтаксис

Скриптовый синтаксис обеспечивает большую гибкость программирования, но требует глубокого знания языка Groovy.

```groovy
node {
    stage('Build') {
        // Шаги для сборки
    }
    stage('Test') {
        // Шаги для тестирования
    }
    stage('Deploy') {
        // Шаги для развертывания
    }
}
```

**Ключевые отличия:**

- Декларативный синтаксис проще и более структурирован, что облегчает чтение и поддержку;
- `node` — указывает на выполнение конвейера на доступном агенте Jenkins
- Больше возможностей для программной логики
- Требует понимания особенностей Groovy DSL

## Основы программирования Jenkinsfile

В языке Groovy можно определять переменные, использовать условные конструкции, циклы, собственные функции и многое другое, что позволяет создавать сложные и гибкие конвейеры.

### Переменные и типы данных

Для определения переменных используется ключевое слово `def`:

```groovy
def myVariable = "Hello, Jenkins!"
```

Типы данных в Groovy включают:

- Числа (целые и с плавающей точкой);
- Строки;
- Булевы значения (true/false);
- Списки (аналог массивов);
- Карты (аналог словарей или объектов);
- Классы.

### Базовые конструкции

#### Условные конструкции

Как и во многих языках программирования, в Groovy используются условные конструкции для выполнения различных действий в зависимости от условий.

```groovy
if (env.BRANCH_NAME == 'main') {
    sh 'echo "Deploying to production"'
} else {
    sh 'echo "Deploying to staging"'
}
```

Также можно использовать конструкции `switch` для множественного выбора:

```groovy
switch (env.BRANCH_NAME) {
    case 'main':
        sh 'echo "Deploying to production"'
        break
    case 'develop':
        sh 'echo "Deploying to staging"'
        break
    default:
        sh 'echo "Deploying to test environment"'
}
```

#### Циклы

В Groovy доступны различные типы циклов, такие как `for`, `while` и `each`.

Пример использования цикла `for`:

```groovy
def environments = ['dev', 'staging', 'prod']
for (env in environments) {
    sh "echo Deploying to ${env}"
}
```

Тот же пример с использованием метода `each`:

```groovy
def environments = ['dev', 'staging', 'prod']
environments.each { env ->
    sh "echo Deploying to ${env}"
}
```

И, соответственно, цикл `while`:

```groovy
def environments = ['dev', 'staging', 'prod']
def index = 0
while (index < environments.size()) {
    def env = environments[index]
    sh "echo Deploying to ${env}"
    index++
}
```

### Объявление функций

Функции в Groovy объявляются с помощью ключевого слова `def`:

```groovy
def greet(name) {
    return "Hello, ${name}!"
}
echo greet('Jenkins')
```

### Встроенные команды и функции

Jenkins предоставляет множество встроенных команд и функций для выполнения различных задач в конвейерах:

- `sh 'command'` — выполнение shell-команды на агенте (для Linux);
- `bat 'command'` — выполнение командной строки на агенте (для Windows);
- `checkout scm` — проверка исходного кода из системы контроля версий;
- `archiveArtifacts 'path'` — архивирование артефактов для последующего использования;
- `junit 'path'` — публикация результатов тестов в формате JUnit;
- `mail to: 'email', subject: 'subject', body: 'body'` — отправка email-уведомления.
- `docker.build('image-name')` — сборка Docker-образа;
- `docker.image('image-name').run()` — запуск контейнера из Docker-образа;
- `withCredentials([usernamePassword(credentialsId: 'cred-id', usernameVariable: 'USER', passwordVariable: 'PASS')]) { ... }` — использование сохранённых учетных данных.

## Основы создания конвейеров в Jenkins

После изучения синтаксиса Groovy и основных конструкций языка, рассмотрим ключевые аспекты создания практических конвейеров в Jenkins. Эти знания помогут создавать гибкие и надежные CI/CD процессы для реальных проектов.

### Работа с переменными окружения

Jenkins предоставляет множество встроенных переменных окружения, которые содержат полезную информацию о текущей сборке. Дополнительно можно определять собственные переменные через блок `environment`.

**Основные встроенные переменные:**

- `env.BRANCH_NAME` — имя текущей ветки
- `env.BUILD_NUMBER` — номер текущей сборки  
- `env.WORKSPACE` — путь к рабочей директории
- `env.JOB_NAME` — имя задачи Jenkins

```groovy
pipeline {
    agent any
    environment {
        // Пользовательские переменные окружения
        MY_VAR = 'custom_value'
        NODE_VERSION = '21'
    }
    stages {
        stage('Environment Info') {
            steps {
                sh 'echo "Branch: ${env.BRANCH_NAME}"'
                sh 'echo "Build number: ${env.BUILD_NUMBER}"'
                sh 'echo "Workspace: ${env.WORKSPACE}"'
                sh 'echo "Node version: ${env.NODE_VERSION}"'
            }
        }
    }
}
```

### Параметризация сборки

Параметры позволяют создавать интерактивные сборки, где пользователь может задать значения во время запуска. Это особенно полезно для развертывания в разные окружения или управления поведением конвейера.

**Типы параметров:**

- `choice` — выбор из предопределенного списка
- `booleanParam` — флаг true/false  
- `string` — текстовое поле
- `password` — скрытое текстовое поле

```groovy
pipeline {
    agent any
    parameters {
        choice(
            name: 'ENVIRONMENT', 
            choices: ['dev', 'staging', 'prod'], 
            description: 'Целевое окружение для развертывания'
        )
        booleanParam(
            name: 'SKIP_TESTS', 
            defaultValue: false, 
            description: 'Пропустить выполнение тестов'
        )
        string(
            name: 'VERSION', 
            defaultValue: '1.0.0', 
            description: 'Версия для развертывания'
        )
    }
    stages {
        stage('Deploy') {
            steps {
                script {
                    // Использование параметров в логике конвейера
                    if (!params.SKIP_TESTS) {
                        sh 'npm test'
                    }
                    sh "echo Deploying version ${params.VERSION} to ${params.ENVIRONMENT}"
                }
            }
        }
    }
}
```

### Обработка ошибок и отказоустойчивость

Правильная обработка ошибок критически важна для стабильной работы CI/CD конвейеров. Jenkins предоставляет несколько механизмов для контроля выполнения и реакции на сбои.

**Основные подходы:**

- Блоки `try-catch` для локальной обработки ошибок
- Секция `post` для действий после завершения стадий
- Управление статусом сборки через `currentBuild.result`

```groovy
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    try {
                        sh 'npm run build'
                        echo "Build completed successfully"
                    } catch (Exception e) {
                        echo "Build failed: ${e.getMessage()}"
                        // Установка статуса сборки
                        currentBuild.result = 'FAILURE'
                        // Повторное выбрасывание исключения для остановки конвейера
                        throw e
                    }
                }
            }
        }
    }
    post {
        failure {
            echo "Pipeline failed - sending notifications"
            // Здесь можно добавить уведомления о сбое
        }
        always {
            echo "Cleaning up workspace"
            cleanWs() // Очистка рабочей области
        }
    }
}
```

## Пример полного Jenkinsfile для Node.js проекта

Ниже приведён пример полного `Jenkinsfile`, который включает в себя все основные этапы CI/CD для Node.js проекта, включая сборку, тестирование, анализ качества кода, создание Docker-образа и развертывание. Данный проект имеет следующие особенности:

- Использование Node.js версии 21;
- Публикация Docker-образов в приватный реестр `your-registry.com`;
- Название приложения `my-app`;
- Разделение на три окружения: `dev`, `staging`, `prod`;
- Развертывание в Kubernetes кластер;
- Использование параметров сборки для выбора окружения и пропуска тестов.

```groovy
pipeline {
    agent any
    
    // setup global environment variables
    environment {
        NODE_VERSION = '21'
        DOCKER_REGISTRY = 'your-registry.com'
        APP_NAME = 'my-app'
    }
    
    // define build parameters
    parameters {
        choice(name: 'ENVIRONMENT', choices: ['dev', 'staging', 'prod'], description: 'Target environment')
        booleanParam(name: 'SKIP_TESTS', defaultValue: false, description: 'Skip running tests')
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Setup') {
            steps {
                sh '''
                    node --version
                    npm --version
                    npm ci
                '''
            }
        }
        
        stage('Lint') {
            steps {
                sh 'npm run lint'
            }
        }
        
        stage('Test') {
            when {
                not { params.SKIP_TESTS }
            }
            steps {
                sh 'npm test'
            }
            post {
                always {
                    junit 'test-results.xml'
                    publishHTML([
                        allowMissing: false,
                        alwaysLinkToLastBuild: true,
                        keepAll: true,
                        reportDir: 'coverage',
                        reportFiles: 'index.html',
                        reportName: 'Coverage Report'
                    ])
                }
            }
        }
        
        stage('Build') {
            steps {
                sh 'npm run build'
                archiveArtifacts artifacts: 'dist/**', fingerprint: true
            }
        }
        
        stage('Docker Build') {
            steps {
                script {
                    def image = docker.build("${env.DOCKER_REGISTRY}/${env.APP_NAME}:${env.BUILD_NUMBER}")
                    docker.withRegistry("https://${env.DOCKER_REGISTRY}", 'docker-registry-credentials') {
                        image.push()
                        image.push('latest')
                    }
                }
            }
        }
        
        stage('Deploy') {
            when {
                anyOf {
                    branch 'main'
                    branch 'develop'
                }
            }
            steps {
                script {
                    def deployEnv = params.ENVIRONMENT
                    if (env.BRANCH_NAME == 'main') {
                        deployEnv = 'prod'
                    } else if (env.BRANCH_NAME == 'develop') {
                        deployEnv = 'staging'
                    }
                    
                    sh """
                        echo "Deploying to ${deployEnv}"
                        kubectl set image deployment/${env.APP_NAME} ${env.APP_NAME}=${env.DOCKER_REGISTRY}/${env.APP_NAME}:${env.BUILD_NUMBER} -n ${deployEnv}
                        kubectl rollout status deployment/${env.APP_NAME} -n ${deployEnv}
                    """
                }
            }
        }
    }
    
    post {
        always {
            cleanWs()
        }
        success {
            mail to: 'team@company.com',
                 subject: "✅ Build Success: ${env.JOB_NAME} - ${env.BUILD_NUMBER}",
                 body: "Build completed successfully. Check console output at ${env.BUILD_URL}"
        }
        failure {
            mail to: 'team@company.com',
                 subject: "❌ Build Failed: ${env.JOB_NAME} - ${env.BUILD_NUMBER}",
                 body: "Build failed. Check console output at ${env.BUILD_URL}"
        }
    }
}
```

Доступ к переменным окружения, параметрам сборки и другим данным Jenkins также возможен через встроенные функции и методы Groovy.

## Передовые практики

При проектировании и реализации CI/CD конвейеров рекомендуется следовать проверенным практикам:

**Безопасность:**

- Никогда не храните секреты (пароли, ключи API) в коде
- Используйте встроенные системы управления секретами
- Применяйте принцип минимальных привилегий для доступа к ресурсам

**Производительность:**

- Кэшируйте зависимости между сборками
- Используйте параллельное выполнение тестов
- Оптимизируйте Docker-образы и время сборки

**Надежность:**

- Настройте мониторинг состояния конвейеров
- Реализуйте механизмы уведомлений о сбоях
- Ведите детальное логирование для отладки

## Библиография

1. [Pipeline as Code, Jenkins](https://www.jenkins.io/doc/book/pipeline/pipeline-as-code)
2. [edeshina, Jenkins Scripted Pipeline: как использовать, Habr, 2023-01-10](https://habr.com/ru/companies/slurm/articles/709804)
3. [Pipeline as Code with Jenkins, Jenkins](https://www.jenkins.io/solutions/pipeline)