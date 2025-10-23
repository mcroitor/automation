# Întrebări pe tema "Pipeline-uri CI/CD"

1. Ce înseamnă abreviația CI în contextul dezvoltării software?
   - [x] Continuous Integration
   - [ ] Computer Integration
   - [ ] Code Implementation
   - [ ] Central Intelligence

2. Care este scopul principal al Integrării Continue (CI)?
   - [x] Integrarea modificărilor de cod într-o bază de cod comună cu verificări automatizate
   - [ ] Automatizarea testelor doar în etapa de lansare
   - [ ] Crearea de copii de rezervă pentru cod în caz de defecțiuni
   - [ ] Managementul versiunilor pentru codul sursă

3. Care este diferența dintre Continuous Delivery și Continuous Deployment?
   - [x] Continuous Delivery pregătește codul pentru lansare dar necesită deployment manual; Continuous Deployment face deployment automat în producție
   - [ ] Continuous Delivery include deployment automat în producție, Continuous Deployment nu
   - [ ] Sunt același concept
   - [ ] Continuous Deployment funcționează doar cu containere

4. Care etapă de obicei NU aparține unui pipeline CI/CD standard?
   - [x] Planificarea arhitecturii aplicației
   - [ ] Construirea artefactelor
   - [ ] Testarea automată
   - [ ] Deployment în mediul de test

5. Ce NU este un artefact în contextul CI/CD?
   - [x] Codul sursă din repository
   - [ ] Fișier JAR compilat
   - [ ] Imagine Docker
   - [ ] Arhivă cu documentație

6. Ce fișier este folosit pentru definirea unui pipeline în GitHub Actions?
   - [x] `.github/workflows/workflow-name.yml`
   - [ ] `.github/ci.yml`
   - [ ] `pipeline.yml`
   - [ ] `github-actions.yml`

7. În ce limbaj de programare se scrie Jenkinsfile?
   - [x] Groovy
   - [ ] Python
   - [ ] JavaScript
   - [ ] Java

8. Ce fișier este folosit pentru definirea unui pipeline în GitLab CI?
   - [x] `.gitlab-ci.yml`
   - [ ] `.gitlab/pipeline.yml`
   - [ ] `gitlab-ci.yaml`
   - [ ] `pipeline.gitlab`

9. Ce înseamnă conceptul "Infrastructure as Code" (IaC) în contextul DevOps?
   - [x] Provizionarea și managementul infrastructurii prin cod în loc de procese manuale
   - [ ] Scrierea codului pentru infrastructură în Java
   - [ ] Crearea infrastructurii doar în cloud
   - [ ] Folosirea doar a containerelor pentru deployment

10. Care este avantajul principal al Integrării Continue?
    - [x] Detectarea și corectarea rapidă a erorilor
    - [ ] Reducerea numărului de dezvoltatori din echipă
    - [ ] Eliminarea necesității de testare
    - [ ] Scrierea automată de cod

11. Ce reprezintă "porțile de calitate" într-un pipeline CI/CD?
    - [x] Praguri automatizate de calitate care opresc pipeline-ul când criteriile sunt încălcate
    - [ ] Dispozitive fizice pentru controlul accesului
    - [ ] Instrumente pentru criptarea datelor
    - [ ] Sisteme de backup

12. Care sunt cele trei componente principale descrise în GitHub Actions workflow?
    - [x] Evenimente, joburi, pași
    - [ ] Build, test, deploy
    - [ ] Dezvoltatori, testeri, administratori
    - [ ] Cod, documentație, teste

13. Ce este un nightly build?
    - [x] Build programat, de obicei zilnic, pentru reducerea încărcării serverului CI
    - [ ] Build care rulează doar noaptea
    - [ ] Build doar pentru versiunea finală a produsului
    - [ ] Build care rulează doar la erori critice

14. Procesul de integrare automată a modificărilor de cod într-o bază de cod comună de mai multe ori pe zi urmată de teste automatizate se numește:
    - [x] Continuous Integration
    - [ ] Continuous Deployment
    - [ ] Continuous Delivery
    - [ ] Continuous Development

15. Ce include etapa "Analiza Calității Codului" într-un pipeline CI/CD?
    - [x] Analiză statică pentru verificarea conformității cu standardele de calitate și securitate
    - [ ] Verificarea sintaxei codului de program
    - [ ] Verificarea performanței produsului software
    - [ ] Măsurarea acoperirii codului cu teste

16. Ce practică DevOps implică externalizarea configurației în fișiere externe?
    - [x] Managementul configurației
    - [ ] Infrastructure as Code
    - [ ] Strategia containerelor
    - [ ] Monitorizarea

17. Ce trei faze include fiecare etapă a pipeline-ului CI/CD?
    - [x] Pregătire, execuție, procesarea rezultatelor
    - [ ] Planificare, execuție, analiză
    - [ ] Build, test, deploy
    - [ ] Dezvoltare, testare, lansare

18. Ce instrument CI/CD este conceput inițial ca soluție self-hosted și necesită instalare pe servere proprii?
    - [x] Jenkins
    - [ ] GitHub Actions
    - [ ] Azure DevOps Services
    - [ ] Travis CI

19. Ce înseamnă termenul "Pipeline as Code"?
    - [x] Definirea pipeline-urilor CI/CD prin fișiere de configurare din repository
    - [ ] Scrierea pipeline-urilor în limbajul de programare C
    - [ ] Crearea pipeline-urilor doar pentru cod
    - [ ] Generarea automată de pipeline-uri

20. Ce dezavantaj NU este caracteristic Integrării Continue?
    - [x] Scăderea calității codului
    - [ ] Costuri suplimentare pentru infrastructură și suport
    - [ ] Necesitatea de resurse de calcul dedicate
    - [ ] Cerințe pentru calificarea echipei de dezvoltare

21. Practica de pregătire automată a codului pentru lansare cu posibilitatea de deployment oricând, dar cu aprobare manuală pentru mediul de producție se numește:
    - [x] Continuous Delivery
    - [ ] Continuous Integration
    - [ ] Continuous Deployment
    - [ ] Continuous Distribution