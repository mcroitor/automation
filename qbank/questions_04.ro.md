# Întrebări pe tema "Controlul versiunilor și colaborarea"

## Cunoștințe

1. Ce este Git?
   - [x] Sistem distribuit de control al versiunilor
   - [ ] Sistem centralizat de control al versiunilor
   - [ ] Sistem de gestionare a bazelor de date
   - [ ] Stocare cloud pentru fișiere
2. Care comandă este folosită pentru inițializarea unui nou repository Git?
   - [x] `git init`
   - [ ] `git create`
   - [ ] `git new`
   - [ ] `git start`
3. Ce face comanda `git add`?
   - [x] Pregătește fișierele pentru commit (staging)
   - [ ] Creează un fișier nou în repository
   - [ ] Adaugă un repository la distanță
   - [ ] Îmbină ramurile
4. Care comandă este folosită pentru crearea unui commit în Git?
   - [x] `git commit -m "message"`
   - [ ] `git save -m "message"`
   - [ ] `git create -m "message"`
   - [ ] `git record -m "message"`
5. Ce informații trebuie configurate obligatoriu la configurarea inițială Git?
   - [x] Numele utilizatorului și email
   - [ ] Parola și token-ul de acces
   - [ ] Calea către proiect și numele ramurii
   - [ ] Adresa serverului și portul de conectare
6. Care este comanda modernă recomandată pentru comutarea între ramuri (Git 2.23+)?
   - [x] `git switch`
   - [ ] `git checkout`
   - [ ] `git branch`
   - [ ] `git change`
7. Ce se întâmplă la executarea comenzii `git clone`?
   - [x] Se creează o copie locală completă a repository-ului la distanță
   - [ ] Se creează o legătură către repository-ul la distanță
   - [ ] Se copiază doar ultimele modificări
   - [ ] Se creează o ramură nouă în repository-ul curent
8. Care fișier este folosit pentru excluderea fișierelor din urmărirea Git?
   - [x] `.gitignore`
   - [ ] `.gitexclude`
   - [ ] `.exclude`
   - [ ] `.ignore`
9. Ce înseamnă hash-ul SHA-1 în contextul Git?
   - [x] Identificator unic al commit-ului
   - [ ] Parola pentru accesul la repository
   - [ ] Numărul versiunii Git
   - [ ] Dimensiunea fișierului în bytes
10. Care comandă arată starea curentă a directorului de lucru?
    - [x] `git status`
    - [ ] `git info`
    - [ ] `git state`
    - [ ] `git check`
11. Ce este un conflict de îmbinare (merge conflict)?
    - [x] Git nu poate îmbina automat modificările din ramuri diferite
    - [ ] Eroare la conectarea la repository-ul la distanță
    - [ ] Nepotrivire de versiuni Git pe computere diferite
    - [ ] Un dezvoltator nu este de acord cu modificările altuia
12. Care comandă este folosită pentru vizualizarea istoricului commit-urilor?
    - [x] `git log`
    - [ ] `git history`
    - [ ] `git show`
    - [ ] `git list`
13. Comanda pentru anularea modificărilor în directorul de lucru?
    - [x] `git restore`
    - [ ] `git undo`
    - [ ] `git unmerge`
    - [ ] `git back`
14. Ce face comanda `git fetch`?
    - [x] Obține actualizări din repository-ul la distanță fără îmbinare automată
    - [ ] Trimite modificări la repository-ul la distanță
    - [ ] Creează o ramură nouă
    - [ ] Șterge modificările locale
15. Care este diferența între `git pull` și `git fetch`?
    - [x] `pull` obține modificări și le îmbină automat, `fetch` doar obține
    - [ ] `pull` lucrează cu ramuri, `fetch` cu commit-uri
    - [ ] `pull` pentru fișiere mari, `fetch` pentru cele mici
    - [ ] Nicio diferență, sunt sinonime
16. Ce este rebase în Git?
    - [x] Rescrierea istoricului commit-urilor pentru crearea unui istoric mai liniar
    - [ ] Crearea unei copii de rezervă a repository-ului
    - [ ] Ștergerea commit-urilor vechi
    - [ ] Îmbinarea tuturor ramurilor într-una
17. Pentru ce este folosit `git stash`?
    - [x] Salvarea temporară a modificărilor neterminate
    - [ ] Crearea unei copii de rezervă permanente
    - [ ] Ștergerea fișierelor inutile
    - [ ] Trimiterea modificărilor la repository-ul la distanță
18. Ce constituie baza arhitecturii Git?
    - [x] Graf aciclic direcționat (DAG)
    - [ ] Bază de date relațională
    - [ ] Listă liniară de modificări
    - [ ] Structură arborescentă de directoare
19. Care comandă creează o ramură nouă și comută imediat la ea?
    - [x] `git checkout -b <branch-name>`
    - [ ] `git branch <branch-name>`
    - [ ] `git switch <branch-name>`
    - [ ] `git branch -s <branch-name>`
20. Ce este un Pull Request (Merge Request)?
    - [x] Cerere de îmbinare a modificărilor dintr-o ramură în alta cu posibilitatea de review al codului
    - [ ] Comandă pentru obținerea modificărilor din repository-ul la distanță
    - [ ] Îmbinare automată a ramurilor în timpul conflictelor
    - [ ] Crearea unei copii de rezervă înainte de modificări
21. Pentru ce tipuri de fișiere este recomandat Git LFS?
    - [x] Fișiere binare mari (media, arhive)
    - [ ] Fișiere text cu cod sursă
    - [ ] Fișiere de configurare
    - [ ] Fișiere de documentație
22. Ce face comanda `git gc`?
    - [x] Optimizează repository-ul ștergând obiectele inutile
    - [ ] Creează un commit nou
    - [ ] Comută la ramura principală
    - [ ] Arată statisticile repository-ului
23. Ce arată comanda `git diff`?
    - [x] Diferențele între directorul de lucru și ultimul commit
    - [ ] Lista tuturor fișierelor din repository
    - [ ] Istoricul modificărilor fișierului
    - [ ] Statisticile commit-urilor pe autori
24. Pentru ce este folosită comanda `git remote add origin <url>`?
    - [x] Adaugă un repository la distanță cu numele origin
    - [ ] Creează o ramură nouă origin
    - [ ] Clonează repository-ul în folderul origin
    - [ ] Stabilește origin ca ramura curentă
25. Care comandă adaugă un fișier în urmărirea Git (tracking)?
    - [x] `git add <filename>`
    - [ ] `git track <filename>`
    - [ ] `git watch <filename>`
    - [ ] `git follow <filename>`

## Înțelegere

1. Cum se inițializează repository-ul `MyProject`?
   - `git init MyProject`
2. Cum se adaugă toate fișierele modificate în urmărire?
   - `git add .`
   - `git add *`
3. Cum se adaugă fișierul `login.js` în urmărire?
   - `git add login.js`
4. Cum se creează un commit cu mesajul "Initial commit"?
   - `git commit -m "Initial commit"`
5. Cum se creează o ramură nouă `feature-login` și se comută la ea?
   - `git checkout -b feature-login`
   - `git switch -c feature-login`
6. Cum se vizualizează istoricul commit-urilor în format scurt?
   - `git log --oneline`
7. Cum se anulează modificările în fișierul `config.txt` din directorul de lucru?
   - `git restore config.txt`
   - `git checkout -- config.txt`
8. Cum se adaugă un repository la distanță cu numele `upstream`?
   - `git remote add upstream <url>`
9. Cum se obțin modificările din ramura la distanță `main` fără îmbinare?
   - `git fetch origin main`
   - `git fetch`
10. Cum se obțin toate modificările din repository-ul la distanță și se îmbină imediat?
    - `git pull`
11. Cum se trimit commit-urile locale la repository-ul la distanță?
    - `git push`
12. Cum se vizualizează starea repository-ului?
    - `git status`
13. Cum se vizualizează ramura curentă?
    - `git branch --show-current`
    - `git branch`
14. Cum se șterge ramura locală `feature-old`?
    - `git branch -d feature-old`
15. Cum se vizualizează diferențele între directorul de lucru și ultimul commit?
    - `git diff`
