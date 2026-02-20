# Automatizare și Scripting

## Descrierea cursului

În prezent, dezvoltarea sistemelor informatice necesită proiecte complexe care implică numeroși pași tehnologici: construire, testare, implementare și monitorizare. Automatizarea acestor procese a devenit o parte integrantă a software-ului modern, permițând echipelor să livreze produse de calitate mai rapid și mai eficient. Acest curs introduce studenții în bazele automatizării și scrierii de scripturi. De asemenea, studenților li se prezintă instrumentul de automatizare Jenkins, detaliile despre implementarea și utilizarea acestuia. Înainte de acest curs, studenții trebuie să fi parcurs cursurile: `Sisteme de operare`, `Tehnologii de rețea`, `Programare în Python` și `Virtualizare și containerizare`.

La finalul acestui curs, studenții vor putea:

- Înțelege conceptele de automatizare și beneficiile acesteia.
- Scrie scripturi pentru automatizarea sarcinilor folosind diferite limbaje de programare.
- Utiliza instrumente și cadre pentru automatizare.
- Configura și utiliza Jenkins pentru automatizarea proceselor CI/CD.
- Optimiza și scala soluțiile de automatizare.
- Înțelege și aplica cele mai bune practici de securitate în automatizare.

Cursul este structurat pe 15 săptămâni și acoperă o serie de teme, inclusiv:

1. Introducere în automatizare
    - Ce este automatizarea?
    - Avantajele automatizării
    - Prezentare generală a limbajelor de script
    - Instrumente și cadre pentru automatizare
2. Bazele scrierii de scripturi
    - Configurarea mediului
    - Scrierea scripturilor Shell în Bash
3. Tehnici avansate de automatizare
    - Planificarea sarcinilor
    - Gestionarea erorilor
    - Jurnalizare și monitorizare
    - Scrierea scripturilor Python
4. Controlul versiunilor și colaborarea
    - Utilizarea Git pentru automatizarea scripturilor
    - Cele mai bune practici pentru colaborare
    - Procesele de revizuire a codului
5. Pipelines CI/CD
    - Integrare continuă
    - Implementare continuă
    - Procese CI/CD
    - Instrumente și tehnologii
6. Jenkins
   - Instalarea și configurarea Jenkins
   - Jenkinsfile
   - Limbajul Groovy
   - Bazele programării pipeline-urilor
7. Optimizare și scalare
    - Ajustarea performanței
    - Scalarea soluțiilor de automatizare
    - Testarea încărcării
8. Infrastructură ca cod (IaC)
    - Introducere în IaC
    - Instrumente și tehnologii (de exemplu, Terraform, Ansible)
    - Cele mai bune practici pentru IaC
9. Securitate în automatizare
    - Practici sigure la scrierea scripturilor
    - Gestionarea datelor sensibile
    - Automatizare în medii securizate
10. Cele mai bune practici pentru automatizare
    - Scrierea scripturilor întreținute
    - Documentație și comentarii
    - Testarea scenariilor automatizate

## Distribuția orelor pe teme

| Nr. | Tema                                 | Teorie, h | Practică, h | Total, h |
| --- | ------------------------------------ | --------- | ----------- | -------- |
| 1   | Introducere în automatizare          | 2         | 0           | 2        |
| 2   | Bazele scrierii de scripturi         | 2         | 2           | 4        |
| 3   | Tehnici avansate de automatizare     | 4         | 4           | 8        |
| 4   | Controlul versiunilor și colaborarea | 2         | 4           | 6        |
| 5   | Pipelines CI/CD                      | 2         | 0           | 2        |
| 6   | Jenkins                              | 4         | 4           | 8        |
| 7   | Agenți Jenkins                       | 4         | 4           | 8        |
| 8   | Optimizare și scalare                | 2         | 4           | 6        |
| 9   | Infrastructură ca cod (IaC)          | 4         | 4           | 8        |
| 10  | Securitate în automatizare           | 2         | 4           | 6        |
| 11  | Practici bune pentru automatizare    | 2         | 0           | 2        |
|     | **Total**                            | **30**    | **30**      | **60**   |

## Temele lucrărilor de laborator

### 1. Shell Scripting

Elaborarea unui script Shell simplu pentru automatizarea unei sarcini.

- Scrierea scriptului în Bash;
- Gestionarea argumentelor din linia de comandă;
- Gestionarea scenariilor negative și a erorilor;
- Jurnalizare și notificări.

### 2. Python Scripting

Crearea unui script Python pentru interacțiunea cu API-ul.

- Scrierea scriptului în Python;
- Gestionarea argumentelor din linia de comandă;
- Gestionarea scenariilor negative și a erorilor;
- Jurnalizare și notificări.

### 3. Planificarea sarcinilor

Configurarea planificatorului de sarcini (cron) pentru executarea regulată a scriptului.

- Configurarea cron pentru executarea regulată a scriptului;
- Monitorizarea execuției sarcinilor;
- Gestionarea erorilor și notificărilor.

### 4. Configurarea Jenkins

Instalarea și configurarea Jenkins pentru CI/CD.

- Instalarea Jenkins;
- Configurarea Jenkins pentru automatizarea proceselor CI/CD;
- Scrierea Jenkinsfile pentru definirea pipeline-ului;
- Bazele programării pipeline-urilor în Groovy.

### 5. CI/CD Pipeline

Crearea unui pipeline CI/CD simplu.

- Crearea Jenkinsfile pentru pipeline-ul CI/CD;
- Configurarea etapelor de construire, testare și implementare;
- Gestionarea erorilor și notificărilor în pipeline.

### 6. Ansible Playbook

Crearea unui Ansible playbook pentru configurarea serverului.

- Scrierea Ansible playbook;
- Configurarea sarcinilor și rolurilor;
- Gestionarea configurației serverelor;
- Gestionarea erorilor și notificărilor.

### 7. Gestionarea artefactelor

Gestionarea artefactelor și a stocării acestora.

- Crearea și gestionarea artefactelor în pipeline-ul CI/CD;
- Stocarea artefactelor în repository;
- Utilizarea artefactelor în diferite etape ale pipeline-ului.

### 8. Monitorizare și jurnalizare

Jurnalizarea și monitorizarea execuției scripturilor.

- Configurarea jurnalizării pentru scripturi;
- Monitorizarea execuției scripturilor și a pipeline-urilor;
- Gestionarea erorilor și notificărilor pe baza monitorizării.

## Bibliografie

1. AMAZON WEB SERVICES. Infrastructure as Code Best Practices [online]. Disponibil la: https://aws.amazon.com/blogs/devops/infrastructure-as-code-best-practices/
2. ATLASSIAN. Automatizarea fluxurilor de lucru [online]. Disponibil la: https://www.atlassian.com/ru/agile/project-management/workflow-automation
3. BASS, L.; WEBER, I.; ZHU, L. DevOps: A Software Architect's Perspective. 2015. Addison-Wesley Professional.
4. BEYER, B.; JONES, C.; PETOFF, J.; MURPHY, N. Site Reliability Engineering: How Google Runs Production Systems. 2016. O'Reilly Media.
5. BRAGANZA, A. Looks good for me! 2024. Manning [online]. Disponibil la: https://www.manning.com/books/looks-good-to-me
6. CHACON, S.; STRAUB, B. Pro Git Book. 2nd Edition. 2014. Apress [online]. Disponibil la: https://git-scm.com/book/en/v2
7. COOPER, M. Advanced Bash-Scripting Guide. 2014 [online]. Disponibil la: https://tldp.org/LDP/abs/html/
8. EDESHINA. Jenkins Scripted Pipeline: cum se utilizează. 2023. Habr [online]. Disponibil la: https://habr.com/ru/companies/slurm/articles/709804
9. FORSGREN, N.; HUMBLE, J.; KIM, G. Accelerate: The Science of Lean Software and DevOps: Building and Scaling High Performing Technology Organizations. 2018. IT Revolution Press.
10. FOWLER, M. Continuous Delivery. 2013. Martin Fowler's Website [online]. Disponibil la: https://martinfowler.com/tags/continuous%20delivery.html
11. FOWLER, M. Refactoring: Improving the Design of Existing Code. 2nd Edition. 2018. Addison-Wesley Professional.
12. GARRELS, M. Bash Guide for Beginners. 2008 [online]. Disponibil la: https://tldp.org/LDP/Bash-Beginners-Guide/html/
13. GARTNER, INC. Magic Quadrant for Application Security Testing. Annual Report [online]. Disponibil la: https://www.gartner.com/en/documents/3980964
14. GDPR - General Data Protection Regulation. Regulation (EU) 2016/679. 2018. European Parliament and Council.
15. GOLDRATT, E. M. Scopul: proces de îmbunătățire continuă. 2021. Alpina Publisher.
16. GOLDRATT, E. M.; COX, J. Scopul-2: nu este vorba de noroc. 2020. Alpina Publisher.
17. HASHICORP. Security Automation with HashiCorp Vault. 2021. HashiCorp Press.
18. HEAP, T. Ansible for DevOps: Server and configuration management for humans. 2020.
19. HODGSON, P. Feature Toggles (aka Feature Flags) [online]. Disponibil la: https://martinfowler.com/articles/feature-toggles.html
20. HUMBLE, J.; FARLEY, D. Continuous Delivery: Reliable Software Releases through Build, Test, and Deployment Automation. 2010. Addison-Wesley Professional.
21. IBM. What is Automation? [online]. Disponibil la: https://www.ibm.com/topics/automation
22. ISO. ISO/IEC 20000-1:2018. Information technology — Service management. 2018 [online]. Disponibil la: https://www.iso.org/standard/70636.html
23. ISO/IEC 27001:2013. Information technology — Security techniques — Information security management systems — Requirements. International Organization for Standardization.
24. KIM, G.; HUMBLE, J.; DEBOIS, P.; WILLIS, J. The DevOps Handbook: How to Create World-Class Agility, Reliability, and Security in Technology Organizations. 2016. IT Revolution Press.
25. MORRIS, K. Infrastructure as Code: Dynamic Systems for the Cloud Age. 2nd Edition. 2020. O'Reilly Media.
26. MORRIS, K. Infrastructure as Code: Managing Servers in the Cloud. 2020. O'Reilly Media.
27. NIST SPECIAL PUBLICATION 800-53. Security and Privacy Controls for Federal Information Systems and Organizations. 2020. National Institute of Standards and Technology.
28. NIST SPECIAL PUBLICATION 800-218. Secure Software Development Framework [online]. Disponibil la: https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-218.pdf
29. OWASP DEVSECOPS GUIDELINE. 2021. Open Web Application Security Project [online]. Disponibil la: https://owasp.org/www-project-devsecops-guideline/
30. POULTON, N. The Terraform Book. 2021.
31. RIUNGU-KALLIOSAARI, L.; MÄKINEN, S.; ADAMS, B.; JUNTUNEN, T.; LEHTONEN, T. DevOps Adoption Benefits and Challenges in Practice: A Case Study. 2016. International Conference on Product-Focused Software Process Improvement, pp. 590-597.
32. SATO, Y. Terraform: Up and Running: Writing Infrastructure as Code. 2019. O'Reilly Media.
33. SHOSTACK, A. Threat Modeling: Designing for Security. 2014. Wiley.
34. SKELTON, M.; PAIS, M. Team Topologies: Organizing Business and Technology Teams for Fast Flow. 2019. IT Revolution Press.
35. VIVESH. Jenkins vs. GitHub Actions vs. GitLab CI. 2024. Dev.to [online]. Disponibil la: https://dev.to/574n13y/jenkins-vs-github-actions-vs-gitlab-ci-2k35
36. VOVANIKYS. De la cod improvizat la CI/CD eficient: construim un Pipeline as Code comun într-o echipă de peste 100 de persoane. 2022. Habr [online]. Disponibil la: https://habr.com/ru/companies/lemana_tech/articles/695604
37. WIKIPEDIA. Automatizare [online]. Disponibil la: https://en.wikipedia.org/wiki/Automation
38. WIKIPEDIA. Teoria constrângerilor [online]. Disponibil la: https://en.wikipedia.org/wiki/Theory_of_constraints
