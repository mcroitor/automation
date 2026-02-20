# Автоматизация и написание сценариев

## Описание курса

В настоящее время разработка информационных систем требует сложных проектов, которые включают в себя множество технологических шагов: сборка, тестирование, развертывание и мониторинг. Автоматизация этих процессов стала неотъемлемой частью современного программного обеспечения, позволяя командам быстрее и эффективнее доставлять качественные продукты. Данный курс знакомит студентов с основами автоматизации и написания сценариев. Также студенту представляется инструмент автоматизации Jenkins, особенности его развертывания и использования. Перед этим курсом студент должен пройти курсы: `Операционные системы`, `Сетевые технологии`, `Программирование на Python` и `Виртуализация и контейнеризация`.

По окончанию курса студенты смогут:

- Понимать концепции автоматизации и ее преимущества.
- Писать сценарии для автоматизации задач с использованием различных языков программирования.
- Использовать инструменты и фреймворки для автоматизации.
- Настраивать и использовать Jenkins для автоматизации процессов CI/CD.
- Оптимизировать и масштабировать решения автоматизации.
- Понимать и применять лучшие практики безопасности в автоматизации.

Курс рассчитан на 15 недель и охватывает ряд тем, включая:

1. Введение в автоматизацию
    - Что такое автоматизация?
    - Преимущества автоматизации
    - Обзор языков сценариев
    - Инструменты и фреймворки автоматизации
2. Основы написания сценариев
    - Настройка окружения
    - Написание Shell скриптов в Bash
3. Расширенные техники автоматизации
    - Планирование задач
    - Обработка ошибок
    - Журналирование и мониторинг
    - Написание Python скриптов
4. Контроль версий и сотрудничество
    - Использование Git для автоматизации сценариев
    - Лучшие практики сотрудничества
    - Процессы ревью кода
5. Конвейеры CI/CD
    - Непрерывная интеграция
    - Непрерывное развертывание
    - Процессы CI/CD
    - Инструменты и технологии
6. Jenkins
   - Установка и настройка Jenkins
   - Jenkinsfile
   - Язык Groovy
   - Основы программирования конвейеров
7. Оптимизация и масштабирование
    - Настройка производительности
    - Масштабирование решений автоматизации
    - Нагрузочное тестирование
8. Инфраструктура как код (IaC)
    - Введение в IaC
    - Инструменты и технологии (например, Terraform, Ansible)
    - Лучшие практики для IaC
9. Безопасность в автоматизации
    - Безопасные практики при написании скриптов
    - Обработка конфиденциальных данных
    - Автоматизация в защищенных средах
10. Лучшие практики для автоматизации
    - Написание поддерживаемых скриптов
    - Документация и комментарии
    - Тестирование автоматизированных сценариев

## Распределение часов по темам

| Nr. | Тема                              | Теория, h | Практика, h | Всего, h |
| --- | --------------------------------- | --------- | ----------- | -------- |
| 1   | Введение в автоматизацию          | 2         | 0           | 2        |
| 2   | Основы написания сценариев        | 2         | 2           | 4        |
| 3   | Расширенные техники автоматизации | 4         | 4           | 8        |
| 4   | Контроль версий и сотрудничество  | 2         | 4           | 6        |
| 5   | CI/CD процессы (Pipelines)        | 2         | 0           | 2        |
| 6   | Jenkins                           | 4         | 4           | 8        |
| 7   | Агенты Jenkins                    | 4         | 4           | 8        |
| 8   | Оптимизация и масштабирование     | 2         | 4           | 6        |
| 9   | Инфраструктура как код (IaC)      | 4         | 4           | 8        |
| 10  | Безопасность в автоматизации      | 2         | 4           | 6        |
| 11  | Лучшие практики для автоматизации | 2         | 0           | 2        |
|     | **Всего**                         | **30**    | **30**      | **60**   |

## Темы лабораторных работ

### 1. Shell Scripting

Написание простого Shell скрипта для автоматизации задачи.

- Написание скрипта на Bash;
- Обработка аргументов командной строки;
- Обработка негативных сценариев и ошибок;
- Журналирование и уведомления.

### 2. Python Scripting

Создание Python скрипта для взаимодействия с API.

- Написание скрипта на Python;
- Обработка аргументов командной строки;
- Обработка негативных сценариев и ошибок;
- Журналирование и уведомления.

### 3. Планирование задач

Настройка планировщика задач (cron) для регулярного выполнения скрипта.

- Настройка cron для регулярного выполнения скрипта;
- Мониторинг выполнения задач;
- Обработка ошибок и уведомления.

### 4. Настройка Jenkins

Установка и настройка Jenkins для CI/CD.

- Установка Jenkins;
- Настройка Jenkins для автоматизации процессов CI/CD;
- Написание Jenkinsfile для определения конвейера;
- Основы программирования конвейеров на Groovy.

### 5. CI/CD Pipeline

Создание простого CI/CD конвейера.

- Создание Jenkinsfile для CI/CD конвейера;
- Настройка этапов сборки, тестирования и развертывания;
- Обработка ошибок и уведомления в конвейере.

### 6. Ansible Playbook

Создание Ansible playbook для конфигурации сервера.

- Написание Ansible playbook;
- Настройка задач и ролей;
- Управление конфигурацией серверов;
- Обработка ошибок и уведомления.

### 7. Управление артефактами

Управление артефактами и их хранение.

- Создание и управление артефактами в CI/CD конвейере;
- Хранение артефактов в репозитории;
- Использование артефактов в различных этапах конвейера.

### 8. Мониторинг и журналирование

Журналирование и мониторинг выполнения скриптов.

- Настройка журналирования для скриптов;
- Мониторинг выполнения скриптов и конвейеров;
- Обработка ошибок и уведомления на основе мониторинга.

## Библиография

1. AMAZON WEB SERVICES. Infrastructure as Code Best Practices [online]. Доступно по адресу: https://aws.amazon.com/blogs/devops/infrastructure-as-code-best-practices/
2. ATLASSIAN. Automatizarea fluxurilor de lucru [online]. Доступно по адресу: https://www.atlassian.com/ru/agile/project-management/workflow-automation
3. BASS, L.; WEBER, I.; ZHU, L. DevOps: A Software Architect's Perspective. 2015. Addison-Wesley Professional.
4. BEYER, B.; JONES, C.; PETOFF, J.; MURPHY, N. Site Reliability Engineering: How Google Runs Production Systems. 2016. O'Reilly Media.
5. BRAGANZA, A. Looks good for me! 2024. Manning [online]. Доступно по адресу: https://www.manning.com/books/looks-good-to-me
6. CHACON, S.; STRAUB, B. Pro Git Book. 2nd Edition. 2014. Apress [online]. Доступно по адресу: https://git-scm.com/book/en/v2
7. COOPER, M. Advanced Bash-Scripting Guide. 2014 [online]. Доступно по адресу: https://tldp.org/LDP/abs/html/
8. EDESHINA. Jenkins Scripted Pipeline: cum se utilizează. 2023. Habr [online]. Доступно по адресу: https://habr.com/ru/companies/slurm/articles/709804
9. FORSGREN, N.; HUMBLE, J.; KIM, G. Accelerate: The Science of Lean Software and DevOps: Building and Scaling High Performing Technology Organizations. 2018. IT Revolution Press.
10. FOWLER, M. Continuous Delivery. 2013. Martin Fowler's Website [online]. Доступно по адресу: https://martinfowler.com/tags/continuous%20delivery.html
11. FOWLER, M. Refactoring: Improving the Design of Existing Code. 2nd Edition. 2018. Addison-Wesley Professional.
12. GARRELS, M. Bash Guide for Beginners. 2008 [online]. Доступно по адресу: https://tldp.org/LDP/Bash-Beginners-Guide/html/
13. GARTNER, INC. Magic Quadrant for Application Security Testing. Annual Report [online]. Доступно по адресу: https://www.gartner.com/en/documents/3980964
14. GDPR - General Data Protection Regulation. Regulation (EU) 2016/679. 2018. European Parliament and Council.
15. GOLDRATT, E. M. Scopul: proces de îmbunătățire continuă. 2021. Alpina Publisher.
16. GOLDRATT, E. M.; COX, J. Scopul-2: nu este vorba de noroc. 2020. Alpina Publisher.
17. HASHICORP. Security Automation with HashiCorp Vault. 2021. HashiCorp Press.
18. HEAP, T. Ansible for DevOps: Server and configuration management for humans. 2020.
19. HODGSON, P. Feature Toggles (aka Feature Flags) [online]. Доступно по адресу: https://martinfowler.com/articles/feature-toggles.html
20. HUMBLE, J.; FARLEY, D. Continuous Delivery: Reliable Software Releases through Build, Test, and Deployment Automation. 2010. Addison-Wesley Professional.
21. IBM. What is Automation? [online]. Доступно по адресу: https://www.ibm.com/topics/automation
22. ISO. ISO/IEC 20000-1:2018. Information technology — Service management. 2018 [online]. Доступно по адресу: https://www.iso.org/standard/70636.html
23. ISO/IEC 27001:2013. Information technology — Security techniques — Information security management systems — Requirements. International Organization for Standardization.
24. KIM, G.; HUMBLE, J.; DEBOIS, P.; WILLIS, J. The DevOps Handbook: How to Create World-Class Agility, Reliability, and Security in Technology Organizations. 2016. IT Revolution Press.
25. MORRIS, K. Infrastructure as Code: Dynamic Systems for the Cloud Age. 2nd Edition. 2020. O'Reilly Media.
26. MORRIS, K. Infrastructure as Code: Managing Servers in the Cloud. 2020. O'Reilly Media.
27. NIST SPECIAL PUBLICATION 800-53. Security and Privacy Controls for Federal Information Systems and Organizations. 2020. National Institute of Standards and Technology.
28. NIST SPECIAL PUBLICATION 800-218. Secure Software Development Framework [online]. Доступно по адресу: https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-218.pdf
29. OWASP DEVSECOPS GUIDELINE. 2021. Open Web Application Security Project [online]. Доступно по адресу: https://owasp.org/www-project-devsecops-guideline/
30. POULTON, N. The Terraform Book. 2021.
31. RIUNGU-KALLIOSAARI, L.; MÄKINEN, S.; ADAMS, B.; JUNTUNEN, T.; LEHTONEN, T. DevOps Adoption Benefits and Challenges in Practice: A Case Study. 2016. International Conference on Product-Focused Software Process Improvement, pp. 590-597.
32. SATO, Y. Terraform: Up and Running: Writing Infrastructure as Code. 2019. O'Reilly Media.
33. SHOSTACK, A. Threat Modeling: Designing for Security. 2014. Wiley.
34. SKELTON, M.; PAIS, M. Team Topologies: Organizing Business and Technology Teams for Fast Flow. 2019. IT Revolution Press.
35. VIVESH. Jenkins vs. GitHub Actions vs. GitLab CI. 2024. Dev.to [online]. Доступно по адресу: https://dev.to/574n13y/jenkins-vs-github-actions-vs-gitlab-ci-2k35
36. VOVANIKYS. De la cod improvizat la CI/CD eficient: construim un Pipeline as Code comun într-o echipă de peste 100 de persoane. 2022. Habr [online]. Доступно по адресу: https://habr.com/ru/companies/lemana_tech/articles/695604
37. WIKIPEDIA. Automatizare [online]. Доступно по адресу: https://en.wikipedia.org/wiki/Automation
38. WIKIPEDIA. Teoria constrângerilor [online]. Доступно по адресу: https://en.wikipedia.org/wiki/Theory_of_constraints

