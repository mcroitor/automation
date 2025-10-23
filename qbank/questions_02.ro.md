# Întrebări despre "Fundamentele Scriptingului"

## Cunoaștere

1. Ce sunt variabilele de mediu?
   - [x] Valori dinamice care pot influența comportamentul proceselor din sistemul de operare
   - [ ] Valori statice stocate în fișiere de configurare
   - [ ] Variabile accesibile doar în scripturile Shell
   - [ ] Constante definite în timpul compilării sistemului
2. Ce variabilă de mediu definește lista de directoare pentru căutarea fișierelor executabile?
   - [x] `PATH`
   - [ ] `HOME`
   - [ ] `USER`
   - [ ] `SHELL`
3. Ce simbol este folosit în Bash pentru a denota începutul unui shebang?
   - [x] `#!`
   - [ ] `#/`
   - [ ] `!/`
   - [ ] `@!`
4. Ce se va întâmpla la executarea comenzii `name = "John"` cu spații în jurul semnului egal în Bash?
   - [x] Va apărea o eroare
   - [ ] Variabila va fi creată corect
   - [ ] Valoarea va fi atribuită cu spații
   - [ ] Comanda va fi ignorată
5. Ce sintaxă este folosită pentru a obține lungimea unui șir în Bash?
   - [x] `${#variable}`
   - [ ] `${variable#}`
   - [ ] `${len(variable)}`
   - [ ] `${variable.length}`
6. Cum se efectuează operații aritmetice cu numere întregi în Bash?
   - [x] Folosind paranteze duble `(( ))`
   - [ ] Folosind paranteze simple `( )`
   - [ ] Folosind paranteze drepte `[ ]`
   - [ ] Folosind acolade `{ }`
7. Ce instrument este folosit pentru operații cu numere în virgulă mobilă în Bash?
   - [x] `bc` (Basic Calculator)
   - [ ] `calc`
   - [ ] `math`
   - [ ] Niciunul, Bash funcționează perfect cu numere în virgulă mobilă
8. Care este diferența dintre ghilimelele simple și duble când lucrezi cu șiruri?
   - [x] Variabilele nu sunt interpolate în ghilimele simple, dar sunt interpolate în ghilimele duble
   - [ ] Ghilimelele simple sunt folosite pentru numere, cele duble pentru șiruri
   - [ ] Nu există diferență, poți folosi oricare
   - [ ] Ghilimelele simple sunt procesate mai rapid
9. Ce sintaxă este folosită pentru a extrage un subșir în Bash?
   - [x] `${variable:start:length}`
   - [ ] `${variable[start:length]}`
   - [ ] `${substr(variable,start,length)}`
   - [ ] `${variable.substring(start,length)}`
10. Cum se obțin toate elementele unui array în Bash?
    - [x] `${array[@]}`
    - [ ] `${array[*all]}`
    - [ ] `${array.all}`
    - [ ] `${array[0..n]}`
11. Ce operator de comparație este folosit pentru a verifica egalitatea numerică în Bash?
    - [x] `-eq`
    - [ ] `==`
    - [ ] `-equal`
    - [ ] `=`
12. Ce operator de comparație este folosit pentru a verifica dacă un număr este mai mic decât altul?
    - [x] `-lt`
    - [ ] `<`
    - [ ] `less`
    - [ ] `-less`
13. Ce operator verifică că un fișier există și este un fișier obișnuit în Bash?
    - [x] `-f`
    - [ ] `-e`
    - [ ] `-d`
    - [ ] `-r`
14. Ce înseamnă operatorul `&&` în linia de comandă în Bash?
    - [x] Execută a doua comandă doar dacă prima s-a terminat cu succes
    - [ ] Execută ambele comenzi în paralel
    - [ ] Execută a doua comandă doar dacă prima a eșuat
    - [ ] Combină rezultatul celor două comenzi
15. Ce înseamnă operatorul `||` în linia de comandă în Bash?
    - [x] Execută a doua comandă doar dacă prima a eșuat
    - [ ] Execută ambele comenzi în paralel
    - [ ] Execută a doua comandă doar dacă prima s-a terminat cu succes
    - [ ] Combină rezultatul celor două comenzi
16. Ce construct este folosit pentru a verifica mai multe condiții în instrucțiunile if în Bash?
    - [x] `elif`
    - [ ] `elseif`
    - [ ] `else if`
    - [ ] `ifelse`
17. Cum se creează un interval numeric într-o buclă for în Bash?
    - [x] `{start..end}`
    - [ ] `[start..end]`
    - [ ] `(start..end)`
    - [ ] `start:end`
18. Care este diferența dintre buclele while și until în Bash?
    - [x] `while` execută în timp ce condiția este adevărată, `until` - în timp ce condiția este falsă
    - [ ] `while` este mai rapid, `until` este mai lent
    - [ ] `while` este pentru numere, `until` este pentru șiruri
    - [ ] Nu există diferență, sunt sinonime
19. Cum se declară o variabilă locală într-o funcție în Bash?
    - [x] `local variable_name=value`
    - [ ] `var variable_name=value`
    - [ ] `private variable_name=value`
    - [ ] `scope variable_name=value`
20. Ce variabilă conține numărul de argumente transmise scriptului în Bash?
    - [x] `$#`
    - [ ] `$@`
    - [ ] `$*`
    - [ ] `$0`
21. Ce face comanda `set -e` în Bash?
    - [x] Termină execuția scriptului la prima eroare
    - [ ] Activează modul de debug
    - [ ] Exportă toate variabilele
    - [ ] Setează encodarea UTF-8
22. Ce simbol este folosit pentru a executa o comandă în fundal în Bash?
    - [x] `&`
    - [ ] `%`
    - [ ] `*`
    - [ ] `@`

## Înțelegere

1. Cum se adaugă directorul `/opt/myapp/bin` la variabila `PATH` în Bash?
   - `export PATH=$PATH:/opt/myapp/bin`
   - `export PATH=/opt/myapp/bin:$PATH`
2. Cum se declară o variabilă `version` cu valoarea "2.0.5" în Bash?
   - `version="2.0.5"`
3. Cum se declară o variabilă `app_name` cu valoarea "myapp" în Bash?
   - `app_name="myapp"`
4. Cum se calculează suma a două numere întregi `a` și `b` în Bash și se stochează rezultatul în variabila `sum`?
   - `sum=$((a + b))`
   - `sum=$(echo "$a + $b" | bc)`
5. Cum se calculează produsul a două numere întregi `a` și `b` în Bash și se stochează rezultatul în variabila `product`?
   - `product=$((a * b))`
   - `product=$(echo "$a * $b" | bc)`
6. Cum se calculează suma a două numere în virgulă mobilă `3.14` și `2.86` în Bash folosind `bc`?
   - `echo "3.14 + 2.86" | bc`
7. Cum se obține lungimea unui șir stocat în variabila `text` în Bash?
   - `${#text}`
8. Cum se extrage un subșir din variabila `str="Hello, World!"` începând de la poziția 7 cu lungimea de 5 caractere în Bash?
   - `${str:7:5}`
9. Cum se înlocuiesc toate aparițiile caracterului "o" cu "O" în variabila `text="Hello, World!"` în Bash?
   - `${text//o/O}`
10. Dat fiind următorul cod Bash:

    ```bash
    text="Hello, World!"
    echo "${text//l/L}"
    ```

    Ce va fi afișat pe ecran ca rezultat al execuției acestui cod?
    - `HeLLo, WorLd!`
11. Cum se adaugă elementul "orange" la un array existent `fruits` în Bash?
    - `fruits+=("orange")`
    - `fruits[${#fruits[@]}]="orange"`
12. Cum se șterge fișierul `installation.log` în terminal?
    - `rm installation.log`
13. Cum se creează fișierul `config.txt` cu conținutul `APP_NAME=app` în terminal?
    - `echo "APP_NAME=app" > config.txt`
14. Cum se creează directorul `logs` și se navighează în el în terminal?
    - `mkdir logs && cd logs`
    - `mkdir logs; cd logs`
15. Cum se afișează lista de fișiere (inclusiv cele ascunse) din directorul `/app/bin` cu informații detaliate în terminal?
    - `ls -la /app/bin`
