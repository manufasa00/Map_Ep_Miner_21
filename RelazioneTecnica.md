# Relazione Tecnica
## INDICE
- ### [Introduzione](#1-introduzione) 
- ### [Requisiti specifici](#2-requisiti-specifici) 
  - Requisiti funzionali
  - Requisiti non funzionali
- ### [System Design](#3-system-design) 
  - Diagramma dei Package
  - Commento sulle decisioni prese
- ### [OO Design](#4-oo-design) 
  - Diagrammi delle Classi 
- ### [Manuale Utente VERSIONE BASE](#51-manuale-utente-versione-base)
  - Guida all'installazione
  - Guida utente con esempi di test
- ### [Manuale Utente VERSIONE ESTESA](#52-manuale-utente-versione-estesa)
  - Guida all'installazione
  - Guida utente con esempi di test  
- ### [Conclusioni](#6-conclusioni)
  - Analisi Retrospettiva

<br/><br/>

# 1. Introduzione
Nella seguente documentazione verrà descritta la ***relazione tecnica*** del caso di studio di **Metodi Avanzati di Programmazione Anno Accademico 2020-2021**. <br/><br/>
Ci presentiamo, il gruppo é composto da: <br/>

<br>

***<h2 style="color: #2e6c80;">Team:</h2>***
<ol style="list-style: none; font-size: 14px; line-height: 32px; font-weight: bold;">
<li style="clear: both;"><img style="float: left;" src="https://media-exp1.licdn.com/dms/image/C4D03AQGnSesK1rbmIg/profile-displayphoto-shrink_400_400/0/1629467176652?e=1636588800&v=beta&t=AYmwbNM9xVL1RvGyaqdZ52COFU0vCzqgpV2kjGZshR0" width="70" />&nbsp;&nbsp;&nbsp;Mario Franco (m.franco34@studenti.uniba.it)<br/>&nbsp;&nbsp;&nbsp;20 anni, Canosa Di Puglia (BT)</li>
</li><br/><li style="clear: both;"><img style="float: left;" src="https://media-exp1.licdn.com/dms/image/C4D03AQHqiw_ZwiDtuQ/profile-displayphoto-shrink_400_400/0/1580052107170?e=1636588800&v=beta&t=8_b5jjevpJpzysnhPM4P_byt12en7Y64yABl7Wug-us" width="70" />&nbsp;&nbsp;&nbsp;Manuel Fasanella (m.fasanella5@studenti.uniba.it)<br/>&nbsp;&nbsp;&nbsp;21 anni, Canosa Di Puglia (BT)</li><br/>
</ol>

<br/>

Il **progetto** svolto consiste nella *progettazione* e *realizzazione* di un sistema ***Client-Server*** (denominato **EPMiner**), ove il ***Server*** include funzionalitá di *data mining* per la scoperta di *pattern frequenti* e *pattern emergenti*, mentre il ***Client*** consente di usufruire del servizio di scoperta *remoto* e visualizza la *conoscenza (pattern) scoperta*.

<br/>

# 2. Requisiti Specifici
## Requisiti funzionali:
Il progetto è stato realizzato in maniera iterativa con diversi "*Sprint*" denominati "**EPMiner #num**", in cui si andava a sviluppare il software in tutte le sue parti e funzionalità, ponendosi degli obiettivi per ogni iterazione, modificando e aggiungendo nuove classi e cambiandone anche la struttura. Nel seguito si riportano i vari momenti di sviluppo del caso di studio, precisamente sono stati 6.

 ### **EPMiner 1**:

**Obiettivo:**
Si definiscano le classi *Java* che modellano attributi (classi **Attribute**, **ContinuousAttribute**, **DiscreteAttribute**) e insieme di transazioni da elaborare per la scoperta di pattern emergenti (classe **Data**). Le classi definite sono:
  - la *classe astratta* **Attribute** che modella un generico attributo discreto o continuo
  - la classe **ContinuousAttribute** che estende la classe Attribute e modella un *attributo continuo* (numerico) rappresentandone il dominio [min,max]
  - la classe **DiscreteAttribute** che estende la classe Attribute e modella un *attributo discreto* rappresentando l’insieme di valori distinti del relativo dominio
  - la classe **Data** (parzialmente fornita dal docente) per modellare un insieme di transazioni (vettori attributo-valore).
  
### **EPMiner 2**:

**Obiettivo:**
Si definiscano le classi Java necessarie a *modellare i pattern* e realizzare l'**algoritmo** per la *scoperta di pattern frequenti e pattern emergenti*. Le classi definite sono:
- la classe **LinkList** che modella una *struttura dati* lista linkata da usare come contenitore per i *pattern frequenti* e le *regole confidenti* (classe fornita dal docente)
- la classe **Cella** che modella un elemento singolo della struttura dati lista linkata (classe fornita dal docente)
- la classe **Puntatore** che modella il puntatore all'elemento successivo nella struttura dati lista linkata (classe fornita dal docente)
- la classe **Queue** che modella una struttura coda che è poi usata come contenitore a modalità *FIFO* per i pattern frequenti scoperti a *livello k* da usare per generare i pattern candidati a *livello k+1* (classe fornita dal docente)
- la classe astratta **Item** che modella un generico *item*(coppia attributo-valore, per esempio Outlook=”Sunny”)
- la classe concreta **DiscreteItem** che estende la classe Item e rappresenta la coppia *<Attributo discreto - valore discreto>* (Ad esempio: Outlook=”Sunny”)
- la classe **FrequentPattern** che rappresenta un *itemset (o pattern) frequente*
- la classe **EmergingPattern** che estende FrequentPattern e modella un *pattern emergente*
- la classe **FrequentPatternMiner** che include i metodi per la *scoperta di pattern frequenti* con *Algoritmo APRIORI*
- la classe **EmergingPatternMiner** che modella la *scoperta di emerging pattern* a partire dalla lista di frequent pattern
- modificato *costruttore* della classe **Data** con quello fornito dal docente.

### **EPMiner 3**:

**Obiettivo:**
Definire package e raggruppare le classi in package. 

La nuova struttura del software prevede una suddivisione in 4 *package*(con le relative classi all'interno) + quello di *default* contenente il **MainTest**:

- **data**:
  - *Attribute*
  - *ContinuousAttribute*
  - *Data*
  - *DiscreteAttribute*
  - *EmptySetException*

- **keyboardinput**:
  - *Keyboard*

- **mining**:
  - *DiscreteItem*
  - *EmergingPattern*
  - *EmergingPatternException*
  - *EmergingPatternMiner*
  - *FrequentPattern*
  - *FrequentPatternMiner*
  - *Item*

- **utility**:
  - *Cella*
  - *EmptyQueue*
  - *LinkList*
  - *Puntatore*
  - *Queue*

Le nuove classi definite sono:
- la classe **Keyboard** (fornita dal docente) in modo tale da modificare **MainTest** per interagire con l'utente per acquisire da tastiera valori validi di *minsup* e *minGR*
- la classe eccezione **EmptySetException** nel package *data* per modellare l’eccezione che occorre qualora l'insieme di training fosse vuoto (non contiene transazioni/esempi). Tale eccezione è sollevata nei costruttori di *FrequentPatternMiner* e *EmergingPatternMiner* ed è gestita in *MainTest*
- la classe eccezione **EmptyQueueException** nel package *utility* per modellare l’eccezione che occorre qualora si cerca di leggere/cancellare da una coda è vuota
- la classe eccezione **EmergingPatternException** nel package *mining* per modellare l’eccezione che occorre qualora il pattern corrente non soddisfa la condizione di minimo grow rate. L'eccezione viene sollevata in computeEmergingPattern.

### **EPMiner 4**:

**Obiettivo:**
Contenitori & Generics.

- Nella classe **Data** è stato sostituito il membro array *attributeSet* con una collezione generica *List\<T>*
- Nella classe **FrequentPattern** è stato sostituito il membro array *fp* con una collezione generica *List\<T>*, è stata implementata l'interfaccia *Iterable\<Item>*,ed è stata implementata l'interfaccia generica *Comparable\<T>* (dove *T* sarà istanziato come *FrequentPattern*);infine è stato implementato **compareTo()** per il confronto tra *pattern* rispetto al *supporto*.
- La classe **Queue** è stata modificata in modo da renderla classe generica
- La classe comparatore **ComparatorGrowRate** è stata definita in modo che implementi l'interfaccia generica *Comparator\<T>* (dove *T* sarà istanziato come *EmergingPattern*): implementare **compare()** per il confronto tra due *emerging pattern* rispetto al *grow rate*.
- Le classi **Puntatore**, **LinkList** e **Cella** sono state rimosse dal package *utility*
- Nelle classi **FrequentPatternMiner** e **EmergingPatternMiner** sono stati cambiati i membri attributi *outputFP* e *epList* in delle collezioni generiche usando la *LinkedList*
- La classe **EmergingPatternMiner** è stata modificata in modo che implementi l'interfaccia *Iterable\<EmergingPattern>*, insieme alla classe **FrequentPatternMiner** in modo che implementi l'interfaccia *Iterable\<FrequentPattern>*
- La classe **FrequentPatternMiner** è stata modificata aggiungendo un metodo privato **sort** che si occupa di ordinare *outputFP* usando il *comparatore* associato alla classe *FrequentPattern*. Modificato il costruttore in modo da ordinare *outputFP* dopo averlo avvalorato
- La classe **EmergingPatternMiner** è stata modificata aggiungendo un metodo privato **sort** che si occupa di ordinare *epList* usando il *comparatore* associato alla classe *EmergingPattern*. Modificato il costruttore in modo da ordinare epList in base al grow rate dopo averlo avvalorato.

### **EPMiner 5**:

**Obiettivo:**
Iteratori & RTTI & Serializzazione.

- Aggiornata la classe **Data** modificando il costruttore in modo che l'attributo *Temperatura* sia *continuo* e assuma valori *numerici* nell’intervallo [0, 30,3](Classe fornita dal docente)
- Definita la classe **Interval** (nel package *mining*) che modella un intervallo *reale* [inf, sup[
- Definita la classe concreta **ContinuousItem** (nel package *mining*) che estende la classe astratta *Item* e modella la coppia *<Attributo continuo - Intervallo di valori>*  (Es. Temperature in [10;30.31[)
- Definita la classe **ContinuousAttributeIterator** (nel package *data*) che implementa l’interfaccia *Iterator\<Float>*. Tale classe realizza l’*iteratore* che itera sugli elementi della sequenza composta da *numValues*, valori reali equidistanti tra di loro (*cut points*), compresi tra *min* e *max* e ottenuti per mezzo di *discretizzazione*. La classe implementa i metodi della interfaccia generica *Iterator\<T>* tipizzata con *Float* (La classe è fornita dal docente)
- Modificata la classe **ContinuousAttribute** in modo che implementi l'interfaccia *Iterable\<Float>*
- Modificati i metodi della classe **FrequentPatternMiner** in modo da utilizzare i meccanismi di *RTTI* dove è necessario riconoscere a *run-time* la classe di cui è istanza un oggetto.
- Modificate le classi **FrequentPatternMiner** ed **EmergingPatternMiner** in modo da implementare, in entrambe, i metodi:
  - "**public void salva(String nomeFile)**" che si occupa di *serializzare* l’oggetto riferito da this nel file il cui nome è passato come parametro
  - "**public static FrequentPatternMiner carica(String nomeFile)**"(stessa signatura per *EmergingPatternMiner* sostituendo il *tipo restituito* con quello della classe) che si occupa di *leggere* e *restituire* l’oggetto come è memorizzato nel file il cui nome è passato come parametro
- Modificate le ulteriori classi coinvolte nella serializzazione in modo che implementino l'interfaccia *Serializable*.

### **EPMiner 6**:

**Obiettivo:**
JDBC & Client-Server.

- Usati gli strumenti di **Mysql** per eseguire lo script *mysqlScript* (fornito dal docente)
- Nel progetto è stato aggiunto il package **database** da popolare con le classi: 
  - **DbAccess** per l'accesso a un *db* (fornita dal Docente)
  - **TableData** che modella l’insieme di *tuple* collezionate in una tabella. La singola tupla è modellata dalla classe **Tuple_Data**, *inner class* di Table_Data (fornita dal docente)
  -  **TableSchema** che modella lo schema di una tabella nel database relazionale (fornita dal docente)
  - **DatabaseConnectionException** che modella l'eccezione riguardante il database (fornita dal docente)
  - **NoValueException** che estende *Exception* per modellare l’assenza di un valore all’interno di un *resultset* (fornita dal docente)
  - **QUERY_TYPE** classe enumerativa (fornita dal docente)
- Rimpiazzato il costruttore della classe **Data** con un costruttore che si occupa di caricare i dati di addestramento da una tabella della *base di dati*. Il nome della tabella è un *parametro* del costruttore (Classe fornita dal Docente)
- Creati due progetti distinti, **Client** e **Server**
- Il progetto *Server* contiene tutte le *classi\package* finora definite ad esclusione di **MainTest**
- Definito il package **server** che contiene le classi:
  - **MultiServer**  che modella un server in grado di accettare le richieste trasmesse da un generico *Client* e istanzia un oggetto della classe *ServerOneClient* che si occuperà di servire le richieste del client in un *thread* dedicato. Il Server sarà registrato su una *porta* predefinita (al di fuori del range 1-1024), per esempio 8080
  - **ServerOneClient** che estende la classe **Thread** che modella la comunicazione con un unico client
- Il progetto *Client* include le classi **MainTest** (fornita dal docente) e **Keyboard**
- Il *client* contatta il *server* usando **ip** e **numero di porta** su cui il server è in ascolto. Una volta instaurata la *connessione* (canale di comunizaione con terminale socket lato cliente) il client trasmette le sue richieste (con i relativi parametri) al server e ne aspetta la risposta.

## Requisiti non funzionali:

Il funzionamento del software richiede:

- Versione **Java SDK 11\OpenJDK 11** o superiore
- Versione **MYSQL 8.0** o superiore installato con servizi MYSQL attivi
- Esecuzione dello script sql "```mysqlScript.sql```" (fornito dal docente) nel caso in cui non sia già importato.
- Consigliato l'utilizzo su **Windows**.

Per la versione **estesa** si consiglia *fortemente* anche:

- Utilizzare dimensioni di testo, app e altri elementi al **100%** nella sezione *"Ridimensionamento e Layout"* delle impostazioni di Windows (soprattutto per laptop).

Per visualizzare il *JavaDoc* di entrambe le versioni è possibile ritrovarlo nelle corrispondenti cartelle ***"doc"*** dei due progetti.

<br/>

# 3. System Design

## Diagrammi dei package per **Server**:
  
  ![diagrammapackageGenerale](./immagini/diagrammaPackageGeneric.png)

## *Commento decisioni prese:*
La suddivisione del progetto server si articola nei 5 package qui raffigurati: **data**, **database**, **mining**, **server** e **utility**.<br/>
Nel package *data* dove viene modellato un attributo(*continuo* o *discreto*) vi è la classe **Data** nella quale figura il legame con il package *database* nel costruttore che modella un insieme di transizioni.<br/>
Nel package *mining* vi sono diversi collegamenti:
- la classe **Item** importa **Attribute** del package *data*
- la classe **ContinuousItem** importa **ContinuousAttribute** del package *data*
- la classe **DiscreteItem** importa **DiscreteAttribute** del package *data*
- la classe **FrequentPattern** importa:
  - **ContinuousAttribute** del package *data*
  - **DiscreteAttribute** del package *data*
  - **Data** del package *data*
- la classe **FrequentPatternMiner** importa:
  - **Attribute** del package *data*
  - **ContinuousAttribute** del package *data*
  - **DiscreteAttribute** del package *data*
  - **Data** del package *data*
  - **EmptySetException** del package *data*
  - **Queue** del package *utility*
  - **EmptyQueueException** del package *utility*
- la classe **EmergingPatternMiner** importa:
  - **Data** del package *data*
  - **EmptySetException** del package *data*

Nel package *server* la classe **ServerOneClient** importa:
- **Data** del package *data*
- **EmptySetException** del package *data*
- **DatabaseConnectionException** del package *database*
- **NoValueException** del package *database*
- **EmergingPatternMiner** del package *mining*
- **FrequentPatternMiner** del package *mining*
- **EmptyQueueException** del package *utility*.


<br/>

# 4. OO Design

## Diagrammi delle classi:

### **Server**

- package **data**:

  ![diagrammaData](./immagini/diagrammaPackageData.png)

- package **database**:

  ![diagrammaDatabase](./immagini/diagrammaPackageDatabase.png)
  
- package **mining**:

  ![diagrammaMining](./immagini/diagrammaPackageMining.png)

- package **server**:

  ![diagrammaServer](./immagini/diagrammaPackageServer.png)

- package **utility**:

  ![diagrammaUtility](./immagini/diagrammaPackageUtility.png)


### **Client**

- package **default package** e **keyboardinput**:

  ![diagrammaClient](./immagini/diagrammaPackageClassClient.png)

### **ClientFx**

- package **defaultPackage**:

  ![diagrammaDefaultFx](./immagini/diagrammaPackageDefaultFx.PNG)

- package **boxes**:

  ![diagrammaBoxesFx](./immagini/diagrammaPackageBoxesFx.PNG)


## *Commento decisioni prese:*

- ***defaultPackage***

  Questo package ha il ruolo di contenere sia le classi principali del programma sia i file **FXML** (file che permettono di impostare gli elementi grafici).<br>
  - Classe **MainTest**: questa classe ha il ruolo di inizializzare la connessione con il Server e la finestra del menu principale
  - Classe **MenuController**: questa classe ha il ruolo di gestire le varie interazioni con il menu
  - Classe **Controller**: questa classe ha il ruolo di gestire le varie interazioni nella sezione *"Nuova Scoperta"*
  - Classe **Controller2**: questa classe ha il ruolo di gestire le varie interazioni nella sezione *"Risultati in Archivio"*
  - File ```menu.fxml```, ```nuova scoperta.fxml```, ```risultati archivio.fxml```: questi file permettono di impostare le tre finestre principali del programma, con elementi grafici e le loro proprietà. Questi ultimi sono stati creati con l'ausilio di ***SceneBuilder*** (software per impostare file FXML con l'anteprima visibile di ciò che si sta impostando).

- ***boxes***
  Questo package ha il ruolo di creare finestre, anche chiamate *"boxes"*, che appaiono a *Pop-Up* sulle altre finestre principali.
  - Classe **InfoBox**: questa classe crea una finestra contenente delle informazioni generali
  - Classe **AlertBox**: questa classe crea una finestra contenente un messaggio di errore.
    


<br/>

# 5.1. Manuale Utente VERSIONE BASE


## **Avvio Database**
- Per utilizzare il nostro software bisogna innanzitutto aver installato sul proprio calcolatore la versione 8 o successive di **MySQL** e avviare il servizio:

   ![servizioMySQL](./immagini/servizioMySQL.png)

## **Avvio Servizio**
- Nella cartella del progetto è presente un file denominato **"guidaInstallazione.bat"** che va ad avviare in maniera *automatizzata* il *Server* per gestire le richieste e il *Client* su cui effettuare le scoperte.

## **Utilizzo Software**
- Le opzioni disponibili a questo punto sono due:
  - ```1: Nuova scoperta```
  - ```2: Risultati in archivio```
### **Opzione 1: Nuova Scoperta**
  - Nel caso in cui inseriamo valori nel range corretto per *minSup* e *minGr* e inseriamo nomi di tabelle esistenti (in questo caso *"playtennistarget"* e *"playtennisbackground"*) visualizzeremo l'output che segue:

    ![nuovaScoperta](./immagini/nuovaScoperta1.png)

    ![nuovaScoperta2](./immagini/nuovaScoperta2.png)

  - Nel caso in cui inseriamo nomi di tabelle sbagliate sia per *target* che per *background* l'output darà due volte errore perchè sono sbagliati entrambi i nomi delle tabelle, come di seguito: 

    ![nomiTabSbagliati](./immagini/nomiTabSbagliati.png)

  - Nel caso in cui inseriamo un nome errato per la tabella background e corretto per quella target, il calcolo dei **Frequent Patterns** avviene comunque poichè prendono in input solo la tabella target mentre la sezione relativa agli **Emerging Patterns** darà errore: 

    ![tabBackgroundError](./immagini/tabBackgroundError.png)

  - Nel caso in cui inseriamo un nome errato per la tabella target e corretto per quella background, l'output sarà un output vuoto poichè senza tabella target risulta impossibile calcolare sia i **Frequent Patterns** che gli **Emerging Patterns** : 

    ![tabTargetError](./immagini/tabTargetError.png)

### **Opzione 2: Risultati in archivio**
 - Nel caso in cui inseriamo valori per cui è avvenuto il calcolo, e quindi esistenti, l'output sarà:

    ![archivioGiusto](./immagini/risultatiArchivioGiusti.png)
        
    ![archivioGiusto2](./immagini/risultatiArchivioGiusti2.png)


  - Nel caso in cui inseriamo valori numerici per *minSup* e *minGr* per cui non è stato ancora effettuata una scoperta, l'output sarà: 

    ![archivioInesistente](./immagini/valoriNonEsistentiArchivio.png)

  - Nel caso in cui inseriamo un valore per *minSup* che abbiamo già calcolato e uno per *minGr* per cui non è stato ancora effettuato il calcolo, l'output sarà:

    ![GrowRateInesistente](./immagini/archivioConGrowRateInesistente.png)

## **Salvataggio File**
- Tutte le scoperte effettuate fino a questo punto saranno presenti nella cartella contenente il file **"client.jar"**, come mostrato in figura: 

  ![Serializzazione](./immagini/salvataggioFileSerializzati.png)

## **Uscita**
- Una volta finito di utilizzare il software, digitare **'n'** per uscire. Il client si chiuderà in automatico e sul server si avrà:

  ![uscita](./immagini/uscitaSoftware.png)

  A questo punto si può decidere di avviare un nuovo client se si vuole continuare a fare scoperte, oppure chiudere *manualmente* il **server** premendo il tasto "chiudi finestra" del server.



<br/>

# 5.2. Manuale Utente VERSIONE ESTESA

## **Introduzione**

- Si precisa che il funzionamento **"lato Server"** è rimasto invariato dalla versione originale, poichè l'estensione realizzata è un'*interfaccia grafica*.

## **Avvio Servizio**
- Nella cartella del progetto è presente un file denominato **"guidaInstallazioneFx.bat"** che va ad avviare in maniera *automatizzata* il *Server* per gestire le richieste e il *ClientFx* su cui effettuare le scoperte.

## **Utilizzo Software**

- All'avvio del software verrà visualizzata la seguente schermata, in cui sarà possibile svolgere diverse azioni:

  ![menu](./immagini/menuEstensione.png)

### **Opzione 1: Nuova Scoperta**

- Una volta selezionata la voce *"Nuova Scoperta"* apparirà la seguente schermata: 
  
  ![NuovaScopertamenu](./immagini/NSmenu.png)

- In questa sezione, per poter effettuare una nuova scoperta bisognerà compilare il **form** che in caso di successo, permetterà di visualizzare la scoperta nell'area di testo **"Risultati"**:

  ![NuovaScopertaSuccesso](./immagini/NSsuccesso.png)

- In caso di qualsiasi *errore di validità* dei valori inseriti, si visualizzerà il messaggio di errore corrispondente al suo tipo:

  ![NuovaScopertaErr](./immagini/NSerrore.png)

  (in questa schermata, l'errore mostrato riguarda l'inserimento di *Data Target*)

<br>

- Interagendo con i bottoni ```"..."```, è possibile visualizzare una descrizione per ogni campo degli elementi del form, come mostrato in figura: 

  ![NuovaScopertaDescr](./immagini/descrizioneMinimum.png)

- Se si effettuano più scoperte, sarà possibile visualizzare una nuova sezione nella finestra attuale, in cui è possibile ritrovare il risultato precedente all'ultima scoperta.

  ![bottomConfronta](./immagini/Confronta.png)

- É possibile anche visualizzare le due aree di testo affiancate, premendo il bottone ```"Confronta"```, in modo tale da poter confrontare meglio più scoperte, come di seguito: 

  ![ConfrontaScoperte](./immagini/confrontoScoperte.png)

  <br>

### **Opzione 2: Risultati in archivio**
 - Una volta selezionata la voce *"Risultati in Archivio"* apparirà una schermata simile alla prima opzione, con la differenza che sarà possibile visualizzare le scoperte effettuate in precedenza (presenti in archivio)
 - Nel caso in cui siano inseriti valori per cui non è stata effettuata alcuna scoperta, apparirà un *messaggio di errore*.

<br>

## **Informazioni**

 - Nel menu principale del programma, utilizzando il bottone a tendina ```"File"```, è possibile visualizzare delle informazioni generali sul software, come mostrato in figura:

   ![informazioni](./immagini/informazioni.png)

<br>

## **Uscita**

- Scegliendo invece la voce ```"esci"```, è possibile chiudere il programma. 

<br>

# 6. Conclusioni

Il modello di realizzazione della relazione da cui siamo partiti è quello che abbiamo proposto nel corso di Ingegneria Del Software, rivelatosi un buon modus operandi essendo stato molto apprezzato. <br>
La relazione è stata poi elaborata in base alle richieste esplicitate per la consegna. 
<br>

Il progetto originale è stato sviluppato in concomitanza delle lezioni di laboratorio, in modo tale da rimanere sempre al passo e chiedere eventuali informazioni nei vari ricevimenti. <br>
Non abbiamo riscontrato particolari problemi poichè le lezioni teoriche erano in parallelo con le richieste dei vari EpMiner.
<br>
Una volta finalizzato la versione base del progetto, ci siamo concentrati sul cercare una valida estensione e alla fine abbiamo deciso di adottare un'interfaccia grafica, nello specifico JavaFx.
<br>
Dopo esserci confrontati sull'utilizzo di quest'ultimo, abbiamo innanzitutto creato le varie "scene" funzionali per il programma originale attraverso l'utilizzo di SceneBuilder.
<br>
Successivamente abbiamo creato il codice con Intellij IDEA (adottato poichè consigliato per la realizzazione di interfacce grafiche con JavaFx) per poter adattare le scene create alle funzionalità vere e proprie del client-server originali.
<br> 
Infine abbiamo realizzato i diagrammi di classe/package, esportati i file ".jar" e generati i rispettivi JavaDoc di entrambe le versioni, creato i file ".bat" per l'automatizzazione del tutto.

<br>

 ### **Analisi Retrospettiva**

- Siamo rimasti soddisfatti del risultato finale, essendo completo in tutte le sue richieste nei limiti delle nostre capacità.

- Siamo rimasti soddisfatti del nostro workflow, essendo stato coordinato e fluido grazie all'ausilio di GitHub in cui caricavamo di volta in volta le diverse versioni del progetto.

  ![GitHub](./immagini/github.png)

- Siamo rimasti amareggiati del fatto che, se avessimo avuto più esperienza nel campo delle interfacce grafiche e di JavaFx, avremmo potuto realizzare qualcosa di ancor più avanzato.



  
