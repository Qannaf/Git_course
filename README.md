# Git cours complet
--------------------
<p align="center">
  <img width="420" height="210" src="images/git.png">
</p>


## Table des matières
1. [Premiers commits](#1)
    1. [config](#1a)
    1. [init](#1b)
    1. [status](#1c)
    1. [add](#1d)
    1. [commit](#1e)
    1. [log](#1f)
    1. [diff](#1g)
1. [Revenir en arrière](#2)
    1. [checkout](#2a)
    1. [revert](#2b)
    1. [reset](#2c)
1. [lLes branches](#3)
    1. [branch](#3a)
    1. [checkout](#3b)
    1. [merge](#3c)
        1. [Fast-Forward ?](#3d)
1. [Manipuler l'historique](#4)
    1. [amend](#4a)
    1. [rebase](#4b)
    1. [rebase -i](#4c)
1. [Le remisage](#5)
    1. [git stash](#5a)
    1. [Stash multiple](#5b)
1. [Remote](#6)
    1. [--bare](#6a)
    1. [remote](#6b)
    1. [push](#6c)
    1. [fetch](#6d)
    1. [pull](#6e)
1. [Fork & Pull request](#7)
    1. [Fork](#7a)
    1. [Pull request](#7b)
    1. [GitHub ou Bitbucket ?](#7c)
1. [Nommer ses commits](#8)


<a name="1"></a>
# Premiers commits

<a name="1a"></a>
<h2>config</h2>
<p>Avant de commencer à faire quoi que ce soit il est important de configurer git. Par défaut la configuration est plutôt satisfaisante mais on va devoir configurer les informations nous concernant. Ces informations seront visibles dans l'historique et permettront de savoir plus tard qui à fait quoi.</p>
<pre class="with-syntax"><code class="hljs coffeescript"><span class="hljs-comment"># git config &lt;option&gt; &lt;valeur&gt;</span>
git config --<span class="hljs-built_in">global</span> user.name <span class="hljs-string">"Mon nom"</span>
git config --<span class="hljs-built_in">global</span> user.email <span class="hljs-string">"mon@email.fr"</span></code></pre>
<p>Le drapeau --global permet d'indiquer à git que cette configuration est globale et affectera ainsi tous nos futurs projets.</p>

<a name="1b"></a>
<h2>init</h2>
<p>La commande <code>git init</code> permet d'initialiser un nouveau dépôt git vide. Cela aura pour effet de créer un dossier <code>.git</code>qui contiendra les informations sur notre versioning. Il ne sera pas possible de versionner sans ce dossier là.</p>
<pre class="with-syntax"><code class="hljs bash"><span class="hljs-built_in">cd</span> <span class="hljs-string">"MON SUPER PROJET"</span>
git init</code></pre>

<a name="1c"></a>
<h2>status</h2>
<p>Comme son nom l'indique cette commande permet d'obtenir un statut sur l'état de notre versioning. Elle donne un rapide résumé des fichiers qui sont en <em>staging</em> et des fichiers non suivis.</p>
<pre class="with-syntax"><code class="hljs lua">git <span class="hljs-built_in">status</span></code></pre>
<p>N'hésitez pas à abuser de cette commande pour savoir où vous en êtes, ça vous évitera de mauvaises surprises par la suite</p>


<a name="1d"></a>
<h2>add</h2>
<p>Une particularité de git est son système de staging qui permet de sélectionner les fichiers à suivre lors du prochain commit. Vous pouvez imaginer ça comme une "zone d'attente" ou on va lister les fichiers que l'on souhaite voir enregistrés.</p>
<pre class="with-syntax"><code class="hljs cs">git <span class="hljs-keyword">add</span> &lt;fichier&gt;   <span class="hljs-meta"># Permet de *stage* le fichier</span>
git <span class="hljs-keyword">add</span> &lt;dossier&gt; <span class="hljs-meta"># Stage tout le dossier</span>
git <span class="hljs-keyword">add</span> *.html        <span class="hljs-meta"># Stage tous les fichier finissant par .html</span>
git <span class="hljs-keyword">add</span> --all            <span class="hljs-meta"># Stage tous les fichiers (même les ajouts et les suppressions)</span></code></pre>
<p>Nous verrons dans un prochain chapitre comment retirer les élément de cette zone de <em>staging</em></p>

<a name="1e"></a>
<h2>commit</h2>
<p>Une fois que la zone de <em>staging</em> est prête on va pourvoir faire notre premier commit. Un commit est une étape dans l'historique de votre projet, étape que l'on va pouvoir identifier avec un message particulier.</p>
<pre class="with-syntax"><code class="hljs sql">git <span class="hljs-keyword">commit</span>  <span class="hljs-comment"># Ouvre un éditeur pour insérer le message de notre commit</span>
git <span class="hljs-keyword">commit</span> -m <span class="hljs-string">"Message pour le commit ^^"</span></code></pre>
<p>On utilisera souvent le drapeau <code>-m</code>qui permettra de spécifier directement le message de notre commit</p>

<a name="1f"></a>
<h2>log</h2>
<p>Sauvegarder les modifications c'est bien, pouvoir les consulter c'est mieux. La commande log permet d'obtenir des informations sur les différents commits de notre projet.</p>
<pre class="with-syntax"><code class="hljs bash">git <span class="hljs-built_in">log</span> <span class="hljs-comment"># Récupère et affiche les derniers commit</span></code></pre>
<p>Il existe quelques options utiles</p>
<ul>
<li><code>--oneline</code>, permet d'afficher l'historique avec une ligne par commit (plus lisible)</li>
<li><code>-n &lt;nombre&gt;</code>, permet de sélectionner le nombre de commit à afficher</li>
<li><code>-p &lt;fichier&gt;</code>, permet de voir l'historique des commits affectant un fichier en particulier</li>
<li><code>--author &lt;motif&gt;</code>, permet de voir l'historique par rapport au nom de l'auteur</li>
</ul>
<p>On remarquera aussi ici que chaque commit fait dans le projet est identifié par une clef sha1, cette clef sert à la fois à s'assurer de l'intégrité du commit, mais aussi de clef unique. C'est cette clef que l'on utilisera pour désigner un commit particulier.</p>

<a name="1g"></a>
<h2>diff</h2>
<p>La commande diff permet de voir les différences qu'ils existent sur un fichier </p>
<pre class="with-syntax"><code class="hljs properties"><span class="hljs-attr">git</span> <span class="hljs-string">diff </span>
<span class="hljs-attr">git</span> <span class="hljs-string">diff &lt;fichier&gt;</span></code></pre>
<p>Nous montre toutes les différences depuis le dernier commit. En revanche si on veut comparer en partant de ce qui est stage il faudra rajouter <code>--cached</code>ou <code>--staged</code></p>
<p>Il est aussi possible de comparer par rapport à un commit ou 2 commits ensemble</p>
<pre class="with-syntax"><code class="hljs xml">git diff <span class="hljs-tag">&lt;<span class="hljs-name">commit</span>&gt;</span>           # comparera l'état actuel au commit <span class="hljs-tag">&lt;<span class="hljs-name">commit</span>&gt;</span>
git diff <span class="hljs-tag">&lt;<span class="hljs-name">commit</span>&gt;</span>..<span class="hljs-tag">&lt;<span class="hljs-name">commit</span>&gt;</span> # Permet de comparer les fichier entre 2 commits</code></span></code></pre>




<a name="2"></a>
# Revenir en arrière
<div class="formatted">
              <p>Écrire l'histoire c'est bien, revenir dans le temps c'est mieux ! Le gros intérêt du versioning est qu'il va nous permettre de revenir en arrière en cas de problème. Pour cela on a plusieurs possibilités.</p>

<a name="2a"></a>
<h2>checkout</h2>
<p>La commande <strong>checkout</strong> permet de faire plusieurs choses</p>
<ul>
<li>Passer de branche en branche (on en parlera dans un prochain chapitre)</li>
<li>Revenir sur un fichier par rapport à un commit</li>
<li>
<p>Revenir sur un commit</p>
<p>git checkout <commit> <fichier></fichier></commit></p>
</li>
</ul>
<p>Permet de transformer le <code>&lt;fichier&gt;</code> tel qu'il était lors du <code>&lt;commit&gt;</code> et l'ajoute au <em>staging</em>.</p>
<pre class="with-syntax"><code class="hljs xml">git checkout <span class="hljs-tag">&lt;<span class="hljs-name">commit</span>&gt;</span></code></pre>
<p>Transforme tous les fichiers pour reproduire l'état du <code>&lt;commit&gt;</code>. Cette commande nous place dans un état particulier appellé <em>detached HEAD</em>. En résumé vous êtes revenu en arrière en tant que spectateur. Vous pouvez voir le projet tel qu'il était au moment du commit tout en ayant la possibilité de revenir dans le <em>"présent"</em>. On utilisera cette commande pour observer des vieux commits, si on souhaite réellement revenir en arrière on utilisera plutôt la commande <em>reset</em>.</p>

<a name="2b"></a>
<h2>revert</h2>
<p><strong>Revert</strong> permet d'inverser un commit. </p>
<pre class="with-syntax"><code class="hljs xml">git revert <span class="hljs-tag">&lt;<span class="hljs-name">commit</span>&gt;</span></code></pre>
<p>Cette commande va défaire ce qui avait été fait au moment du <code>&lt;commit&gt;</code> en créant un nouveau commit. Cela n'altère pas l'historique mais va ajouter un nouveau commit d'inversion (les lignes ajoutées seront supprimées, les fichiers supprimés seront recréés...).</p>

<a name="2c"></a>
<h2>reset</h2>
<p>Tout comme la commande checkout, la commande reset permet de faire plusieurs choses à la fois. En revanche il faudra faire très attention lors de l'utilisation de cette commande car elle altère l'historique et peut dans certains cas supprimer vos modifications (si vous voyez --hard, vérifiez 6 fois ce que vous voulez faire).</p>
<pre class="with-syntax"><code class="hljs xml">git reset <span class="hljs-tag">&lt;<span class="hljs-name">fichier</span>&gt;</span></code></pre>
<p>Supprime un fichier de la zone de staging, mais ne supprime pas les modifications qui sont faites </p>
<pre class="with-syntax"><code class="hljs nginx"><span class="hljs-attribute">git</span> reset</code></pre>
<p>Supprime tous les fichiers de la zone de staging, sans supprimer les modifications.</p>
<pre class="with-syntax"><code class="hljs sql">git <span class="hljs-keyword">reset</span> <span class="hljs-comment">--hard</span></code></pre>
<p>Cette commande est à utiliser avec <strong>extrême précaution</strong>, elle renvoit le dossier de travail au niveau du dernier commit. Toutes les modifications non commit seront perdues.</p>
<pre class="with-syntax"><code class="hljs sql">git <span class="hljs-keyword">reset</span> &lt;<span class="hljs-keyword">commit</span>&gt; </code></pre>
<p>Permet de revenir en arrière jusqu'au <code>&lt;commit&gt;</code>, réinitialise la zone de staging tout en laissant votre dossier de travail en l'état. L'historique sera perdu (les commits suivants <code>&lt;commit&gt;</code> seront perdus, mais pas vos modifications). Cette commande vous permet surtout de nettoyer l'historique en resoumettant un commit unique à la place de commit trop éparses.</p>
<pre class="with-syntax"><code class="hljs sql">git <span class="hljs-keyword">reset</span> &lt;<span class="hljs-keyword">commit</span>&gt; <span class="hljs-comment">--hard</span></code></pre>
<p>Permet de revenir au <code>&lt;commit&gt;</code> et réinitialise la zone de staging et le dossier de travail pour correspondre. Toutes les modifications, ainsi que tous les commits fait après le <code>&lt;commit&gt;</code> seront supprimés. À utiliser avec une extrême précaution !</p>
<p>La commande <strong>reset</strong> ne devra jamais être utilisée après avoir publié (<em>push</em>) vos modifications. En revanche, elle peut être utile pour nettoyer votre historique local avant de l'envoyer en ligne.</p>
            </div>



<a name="3"></a>
# Les branches
<div class="formatted">
              <p>Les branches permettent d'avoir un historique non linéaire et permettent de travailler pendant un moment sur une fonctionnalité particulière sans pour autant "polluer" le flux principal. Elles peuvent servir à travailler sur des fonctions spéciales mais aussi être utilisées pour garder une bonne organisation avec des branches qui correspondent à nos différents environnements (master, recipe, dev, bugfix...).</p>

<a name="3a"></a>
<h2>branch</h2>
<p>La commande <code>branch</code> permet de gérer tout ce qui a trait aux branches (ajout, listing, suppression, renommage). </p>
<pre class="with-syntax"><code class="hljs xml">git branch              # Permet de lister les branches
git branch <span class="hljs-tag">&lt;<span class="hljs-name">branche</span>&gt;</span>    # Permet de créer une nouvelle branche <span class="hljs-tag">&lt;<span class="hljs-name">branche</span>&gt;</span>
git branch -m <span class="hljs-tag">&lt;<span class="hljs-name">branche</span>&gt;</span> # Renomme la branche courante en <span class="hljs-tag">&lt;<span class="hljs-name">branche</span>&gt;</span>
git branch -d <span class="hljs-tag">&lt;<span class="hljs-name">branche</span>&gt;</span> # Permet de supprimer une branche</code></pre>
<p>Attention ! On ne peut pas supprimer une branche qui n'aurait pas été fusionné avec une autre (on perdrait alors les modifications de la branche). Si on souhaite forcer cette suppression, et perdre tout le travail effectué dessus il faudra utiliser un D majuscule.</p>
<pre class="with-syntax"><code class="hljs nginx"><span class="hljs-attribute">git</span> branch -D &lt;branche&gt;  <span class="hljs-comment"># Supprime la branche même si elle n'a pas été fusionnée</span></code></pre>

<a name="1b"></a>
<h2>checkout</h2>
<p>Une fois les branches créées, il faut être capable d'aller d'une branche à une autre. Pour cela, on peut compter sur la commande <code>checkout</code> vu précédemment.</p>
<pre class="with-syntax"><code class="hljs xml">git checkout <span class="hljs-tag">&lt;<span class="hljs-name">branche</span>&gt;</span></code></pre>
<p>Permet de se rendre sur une branche existante. En revanche, si vous le souhaitez vous pouvez demander à git de sauter sur une branche qui n'existe pas en la créant au préalable.</p>
<pre class="with-syntax"><code class="hljs properties"><span class="hljs-attr">git</span> <span class="hljs-string">checkout -b &lt;branche&gt; </span>
<span class="hljs-comment"># équivalent à </span>
<span class="hljs-attr">git</span> <span class="hljs-string">branch &lt;branche&gt;</span>
<span class="hljs-attr">git</span> <span class="hljs-string">checkout &lt;branche&gt;</span></code></pre>

<a name="3c"></a>
<h2>merge</h2>
<p>Merge permet de ramener une branche sur une autre et ainsi de la fusionner. La fusion de 2 branche se fait toujours à partir de la branche principale.</p>
<ul>
<li>La branche "source" sera affectée en récupérant l'historique de la branche ou un commit de fusion</li>
<li>La branche fusionnée ne sera pas affectée</li>
</ul>
<pre class="with-syntax"><code class="hljs xml">git merge <span class="hljs-tag">&lt;<span class="hljs-name">branche</span>&gt;</span></code></pre>
<p>Fusionne la branche <code>&lt;branche&gt;</code> avec la branche courante. Git choisira automatiquement l'algorithme de fusion à utiliser.</p>
<pre class="with-syntax"><code class="hljs nginx"><span class="hljs-attribute">git</span> merge --<span class="hljs-literal">no</span>-ff &lt;branche&gt;</code></pre>
<p>Fusionne la branche <code>&lt;branche&gt;</code> avec la branche courante en générant un commit de fusion (même si un fast-foward est possible). </p>


<a name="3d"></a>
<h3>Fast-Forward ?</h3>
<p>Un Fast-forward, est utilisé quand il existe un chemin simple pour relier notre branche et la branche cible. En effet, si il n'y a pas eu de commit entre temps la fusion consiste à ajouter les commit de la branche cible à la suite du dernier commit de la branche courante. Voici un petit schéma issu de <a href="https://fr.atlassian.com/git/tutorials/using-branches/git-merge">atlassian.com</a> pour mieux comprendre de quoi il s'agit.</p>
<img src="images/git-fast-forward.svg" width="555" height="629" alt="crédits atlassian.com">
<p>En revanche un fast-forward n'est pas possible si les 2 branches évoluées en même temps. Git n'a alors pas d'autre choix que d'effectuer un <strong>3-way merge</strong> en effectuant un commit pour rattacher les 2 branches.</p>
<img src="images/git-merge.svg" width="555" height="765" alt="crédits atlassian.com">
<p><strong>Fast-forward</strong> ou <strong>3-way merge</strong> ? Le choix d'une stratégie de fusion va dépendre du cas à traiter.<br>
Dans le cas d'un bufix ou d'une petite feature on préfèrera utiliser un <strong>fast-forward</strong> afin de garder un historique linéaire.<br>
En revanche pour l'intégration d'une nouvelle fonctionnalité importante avec beaucoup de commit on préfèrera utiliser un <strong>3-way-merge</strong> afin d'obtenir un historique plus organisé.</p>
            </div>

<a name="4"></a>
# Manipuler l'historique
<div class="formatted">
              <p>Manipuler l'historique peut parfois s'avérer utile pour corriger un commit mal effectué mais aussi pour préparer une branche avant la fusion.</p>

<a name="4a"></a>              
<h2>amend</h2>
<p>L'argument <code>--amend</code> permet de rajouter les fichier en staging dans le commit précédent. Ceci permet de corriger un oubli et d'éviter de faire 10 commits pour la même chose.</p>
<pre class="with-syntax"><code class="hljs sql">git <span class="hljs-keyword">commit</span> <span class="hljs-comment">--amend</span></code></pre>
<p>Il est important de ne jamais <em>amend</em> un commit déjà publié au risque de rendre compromettre l'historique de tout le monde. A n'utiliser que pour des petits oublis en local.</p>

<a name="4b"></a>
<h2>rebase</h2>
<p>Comme son nom l'indique rebase permet de déplacer une branche et de changer son commit de départ (sa base). Un petit schéma pour mieux comprendre :</p>
<img src="images/git-rebase.svg" width="555" height="377" alt="crédits atlassian.com">
<p>Dans le principe c'est très simple, on déplace nos 2 commits. En revanche git va réécrire l'historique, supprimer nos anciens commits et recréer 2 nouveau commits à partir de la nouvelle base (comprendre par là que les commits changent d'ID)</p>
<pre class="with-syntax"><code class="hljs cs">git rebase &lt;nouvelle-<span class="hljs-keyword">base</span>&gt;</code></pre>
<p>Permet de changer la base de la branche courante pour la<code>&lt;nouvelle-base&gt;</code>.</p>
<h3>Pourquoi Rebase ?</h3>
<p>On peut se demander à quoi peut servir une telle opération. Le rebase va nous être utile pour forcer un fast-forward lors d'une fusion de branche. Reprenons le cas d'une branche que l'on souhaite fusionner :</p>
<img src="images/git-branch.svg" width="555" height="264" alt="crédits atlassian.com">
<p>Le problème ici, c'est qu'un merge entrainera un <strong>3-way merge</strong> qui va générer un nouveau commit de fusion et qui rendra l'historique plus complexe à lire. Le rebase va alors nous permettre de se placer dans un cas propice à un <strong>fast-forward</strong>.</p>
<pre class="with-syntax"><code class="hljs nginx"><span class="hljs-attribute">git</span> checkout feature <span class="hljs-comment"># On va sur la branche feature</span>
git rebase master  <span class="hljs-comment"># Notre branche commencera au bout de master</span>
git checkout master <span class="hljs-comment"># On retourne sur master</span>
git merge feature <span class="hljs-comment"># On fusionne feature et master</span></code></pre>
<p>Et pour ceux qui préfèrent les images.</p>
<img src="images/git-rebase-merge.svg" width="555" height="823" alt="crédits atlassian.com">
<p>On voit ici qu'un rebase nous permet de garder un historique simple et linéraire qui sera plus simple à comprendre. </p>


<a name="4c"></a>
<h2>rebase -i</h2>
<p>Le drapeau -i permet de déclencher un rebase interactif. Ce mode nous permet de guider git dans son <em>rebase</em> et de lui dire comment organiser les nouveaux commits.</p>
<pre class="with-syntax"><code class="hljs cs">git rebase -i &lt;nouvelle-<span class="hljs-keyword">base</span>&gt;</code></pre>
<p>Cette commande va ouvrir un éditeur nous permettant de dire à git comment réorganiser les différents commit à partir de la nouvelle base</p>
<ul>
<li><strong>pick</strong>, permet de d'inclure le commit. On peut en profiter pour changer l'ordre des différents commit</li>
<li><strong>reword</strong>, permet d'inclure le commit tout en ayant la possibiliter de changer le message</li>
<li><strong>edit</strong>, permet d'éditer le commit. En séparant en plusieurs commits par exemple</li>
<li><strong>squash</strong>, combine le commit avec le commit du dessus et permet de changer le message du commit</li>
<li><strong>fixup</strong>, comme <strong>squash</strong> mais utilisera le message du commit situé au dessus</li>
<li><strong>exec</strong>, permet de lancer des commandes shell sur le commit</li>
</ul>
<p>Bien que très très très très très très très fooooortement déconseillé on peut utiliser le rebase interactif pour modifier l'historique de la branche en cours </p>
<pre class="with-syntax"><code class="hljs nginx"><span class="hljs-attribute">git</span> rebase -i HEAD~<span class="hljs-number">6</span></code></pre>
<p>Permet par exemple de modifier les 6 derniers commits.</p>
            </div>



<a name="5"></a>
# Le remisage
<div class="formatted">
              <p>Git a changé notre façon de coder à plusieurs. Mais certaines contraintes dues à la nature d'un projet ou la répartition des rôles dans une équipe nous oblige parfois à arrêter le travail en cours et passer une autre branche, ce qui entraîne un <em>commit</em> inévitable.  Cela peut s'avérer gênant, car on se retrouve avec des comits ne correspondant à rien et rendant le projet instable. Heureusement, Guite a pensé à tout en mettant en place un système de <em>remisage</em> qui va vous permettre de stocker temporairement les modifications que vous avez effectuées pour pouvoir les réhabiliter plus tard (ceci permettra d'éviter des commit avec des messages du style "Fix du bug de l'an 2000 in progress").</p>

<a name="5a"></a>
<h2>git stash</h2>
<p>Imaginons, vous avez des modifications en cours de création et vous avez envie de les mettre de côté temporairement, plutôt que de commit les différentes modifications vous alliez les stocker grâce au remisage.</p>
<pre class="with-syntax"><code class="language-bash hljs">git stash</code></pre>
<p>Cette commande va mettre de côté toutes les modifications qui ont été apportées au projet depuis le dernier commit (si vous faites la commande <code>git status</code> vous verrez alors qu'il n'y a plus de fichiers en attente de modifications). Vous pouvez alors continuer à travailler sur autre chose (faire vos commits de manière traditionnelle) et ré appliquer plus tard ces modifications avec la commande :</p>
<pre class="with-syntax"><code class="language-bash hljs">git stash apply</code></pre>
<p>Il est possible de voir l'ensemble des <em>stash</em> sauvegardés avec </p>
<pre class="with-syntax"><code class="language-bash hljs">git stash list</code></pre>
<p>Vous verrez au passage que le dernier remisage que vous avez fait est toujours présent. En effet, lorsque vous appliquez les modifications, Git ne supprime pas automatiquement ce que vous avez sauvegardé.Si vous souhaitez supprimer le dernier stash qui a été effectué il faudra alors taper la commande : </p>
<pre class="with-syntax"><code class="language-bash hljs">git stash drop</code></pre>
<p>enfin il est possible de combiner les commandes <code>apply</code> et <code>drop</code> en utilisant la commande <code>pop</code> </p>
<pre class="with-syntax"><code class="language-bash hljs"> git stash pop
 <span class="hljs-comment"># équivaut à </span>
 git stash apply
 git stash drop</code></pre>


 <a name="5b"></a>
<h2>Stash multiple</h2>
<p>Il est possible d'avoir plusieurs stash stockés en mémoire. Pour lister l'ensemble des éléments qui se situent dans votre remisage il vous faudra taper la commande :</p>
<pre class="with-syntax"><code class="language-bash hljs">git stash list
<span class="hljs-comment"># stash@{0}: WIP on master: 04f9aed Fix effets spéciaux</span>
<span class="hljs-comment"># stash@{1}: WIP on master: a25d951 Lorem ipsum dolores</span></code></pre>
<p>Pour appliquer la remise stash@{1} (c'est pas beau ce nom ?) : </p>
<pre class="with-syntax"><code class="hljs css"><span class="hljs-selector-tag">git</span> <span class="hljs-selector-tag">stash</span> <span class="hljs-selector-tag">apply</span> <span class="hljs-selector-tag">stash</span>@{1}</code></pre>
<p>Je ne vous le cache pas, il arrive souvent qu'on ne sache plus à quoi correspond tel ou tel stash, heureusement il est possible d'avoir plus de détails sur le contenu d'un stash.</p>
<pre class="with-syntax"><code class="hljs css"><span class="hljs-selector-tag">git</span> <span class="hljs-selector-tag">stash</span> <span class="hljs-selector-tag">show</span> <span class="hljs-selector-tag">stash</span>@{1} <span class="hljs-selector-tag">-p</span></code></pre>
<p>Une autre bonne pratique est de nommer ses stashs</p>
<pre class="with-syntax"><code class="language-bash hljs">git stash save <span class="hljs-string">"J'ai tout cassé"</span></code></pre>
<p>Voilà ! Vous savez tout ce qu'il y a savoir sur le remisage sur Git. C'est une commande méconnue qui va vous permettre de vous sortir de pas mal de situations épineuses et qui vous permet d'éviter des commit "forcés". Si vous souhaitez avoir plus d'informations sur les possibilités de cette commande (l'ensemble des commandes disponibles, mais aussi leurs options) vous pouvez consulter <a href="https://git-scm.com/docs/git-stash">la documentation</a>. </p>
            </div>

<a name="6"></a>
# Remote
<div class="formatted">
              <p>Utiliser un dépôt git en local c'est bien, mais le gros intérêt du versionning c'est de pouvoir travailler à distance mais aussi de collaborer à plusieurs.</p>

<a name="6a"></a>
<h2>--bare</h2>
<p>Lorsque l'on fait un <code>git init</code> on a la possibilité d'ajouter le drapeau --bare. Cette option permet de préciser que ce dossier ne contiendra pas de dossier de travail mais seulement l'historique de notre projet. Ces dossiers --bare peuvent être utilisés comme dépôt distant. </p>
<pre class="with-syntax"><code class="hljs properties"><span class="hljs-attr">cd</span> <span class="hljs-string">mon-remote</span>
<span class="hljs-attr">git</span> <span class="hljs-string">init --bare</span></code></pre>
<p>Avec git n'importe quoi peut servir de dépôt distant. On peut utiliser un dossier spécifique, un chemin ssh://, un service tiers comme bitbucket ou github. Je vous conseille de vous faire la main avec un dossier servant de remote dans un premier temps avant de vous lancer sur ces services qui introduisent de nouvelles notions.</p>

<a name="6b"></a>
<h2>remote</h2>
<p>La commande <code>remote</code>vous permet de créer voir et supprimer des connexions. Il faut voir ces connexions comme de simples alias vers le véritable chemin du dépôt. Ces chemins étant beaucoup plus simple à taper et surtout à retenir !</p>
<pre class="with-syntax"><code class="hljs cs">git remote <span class="hljs-meta"># Liste les dépôts distants</span>
git remote -v <span class="hljs-meta"># Liste les dépôts distants et les chemins associés</span>
git remote <span class="hljs-keyword">add</span> &lt;<span class="hljs-keyword">alias</span>&gt; &lt;chemin/url&gt; <span class="hljs-meta"># Ajoute un nouveau dépôt distant</span>
git remote rm &lt;<span class="hljs-keyword">alias</span>&gt; <span class="hljs-meta"># Supprimé un dépôt distant</span>
git remote rename &lt;old&gt; &lt;<span class="hljs-keyword">new</span>&gt;</code></pre>

<a name="6c"></a>
<h2>push</h2>
<p>La commande push permet de transférer les commits locaux vers le dépôt distant.</p>
<pre class="with-syntax"><code class="hljs xml">git push <span class="hljs-tag">&lt;<span class="hljs-name">remote</span>&gt;</span> <span class="hljs-tag">&lt;<span class="hljs-name">branche</span>&gt;</span>
git push <span class="hljs-tag">&lt;<span class="hljs-name">remote</span>&gt;</span> --all # Permet d'envoyer toutes les branches</code></pre>
<p>La commande push permet d'envoyer tous les commits d'une ou plusieurs branche au dépôt distant. Git ne permet pas de push si le dépôt distant est en décalage (pas de fast-forward possible) et dans ce cas là vous pouvez utiliser le drapreau --force</p>
<pre class="with-syntax"><code class="hljs lua">git push &lt;remote&gt; <span class="hljs-comment">--force </span></code></pre>
<p>Ce drapeau doit être utilisé en dernier recours (normalement vous n'en aurez jamais besoin) car il va modifier l'historique distant et peu ainsi affecter tous les collaborateurs. Mais ça peut être utile en cas de problème, si par exemple vous envoyez un commit en oubliant de retirer une clef d'API ou une information sensible.</p>


<a name="6d"></a><h2>fetch</h2>
<p>La commande fetch permet d'importer les informations du dépôt distant. L'import se fait à travers des branches spéciales pour nous donner la possibiliter de comparer et si besoin fusionner manuellement.</p>
<pre class="with-syntax"><code class="hljs xml">git fetch <span class="hljs-tag">&lt;<span class="hljs-name">remote</span>&gt;</span> # Récupère toutes les branches et tous les commits 
git fetch <span class="hljs-tag">&lt;<span class="hljs-name">remote</span>&gt;</span> <span class="hljs-tag">&lt;<span class="hljs-name">branche</span>&gt;</span></code></pre>
<p>En général on peut sauter cette étape mais si on souhaite par exemple comparer notre branche master à celle disponible à distance un fetch est essentiel.</p>
<pre class="with-syntax"><code class="hljs bash">git fetch origin master 
git <span class="hljs-built_in">log</span> master..origin/master <span class="hljs-comment"># Permet de voir les commits entre ma branche master et celle du remote</span></code></pre>
<p>Si les modifications me semble acceptable pour une fusion je peux alors fusionner manuellement</p>
<pre class="with-syntax"><code class="hljs sql">git <span class="hljs-keyword">merge</span> origin/<span class="hljs-keyword">master</span></code></pre>

<a name="6e"></a>
<h2>pull</h2>
<p>Récupérer les infos du remote avec un fetch puis un merge n'est pas forcément très "user-friendly". La commande pull permet de faire un <code>git fetch</code> suivi d'un <code>git merge</code> en une seule commande.</p>
<pre class="with-syntax"><code class="hljs xml">git pull <span class="hljs-tag">&lt;<span class="hljs-name">remote</span>&gt;</span>
git pull <span class="hljs-tag">&lt;<span class="hljs-name">remote</span>&gt;</span> <span class="hljs-tag">&lt;<span class="hljs-name">branche</span>&gt;</span></code></pre>
<p>Si votre dépôt local est en avance git fera alors un <strong>3-way merge</strong>. Si vous souhaitez éviter ça vous pouvez demander à git de faire un rebase automatiquement lors du pull.</p>
<pre class="with-syntax"><code class="hljs lua">git pull <span class="hljs-comment">--rebase &lt;remote&gt; </span></code></pre>
<p>Il est possible d'indiquer à git que l'on souhaite faire un rebase par défaut en modifiant dans la configuration <code>branch.autosetuprebase</code>.</p>
<pre class="with-syntax"><code class="hljs lua">git <span class="hljs-built_in">config</span> <span class="hljs-comment">--global branch.autosetuprebase always</span></code></pre>
<p>Cela permet d'éviter de "poluer" l'historique de multiples "merge origin/master".</p>
            </div>


<a name="7"></a>
# Fork & Pull request
<div class="formatted">
              <p>Nous allons maintenant parler des services tiers <a href="https://bitbucket.org/">Bitbucket</a> et <a href="https://github.com/">GitHub</a> qui permettent d'héberger vos projets versionnés avec Git.</p>
<a name="7a"></a>
<h2>Fork</h2>
<p>Un fork désigne une copie d'un dépôt. En effet, par défaut il n'est pas possible de faire de commit sur un dépôt qui ne nous appartient pas (heureusement sinon ça serait l'anarchie). Du coup, les services ont introduit cette notion de fork qui permet de se retrouver avec un dépôt sur lequelle on aura la permission d'écriture</p>

<a name="7b"></a>
<h2>Pull request</h2>
<p>La notion de pull request va de paire avec le système de Fork. Une fois que l'on a travaillé sur notre fork on souhaite souvent proposer à l'auteur original nos modifications. On fera alors un <strong>pull request</strong> qui consiste tout simplement à demander à l'auteur original de <strong>merge</strong> nos modifications. Ce processus est géré de manière quasi automatique par GitHub et Bitbucket.</p>
<a name="7c"></a>
<h2>GitHub ou Bitbucket ?</h2>
<p>Les 2 services proposent des fonctionnalités similaires et je ne me lancerais pas ici dans une comparaison profonde. Ceci étant dit :</p>
<ul>
<li>Si votre projet est open source, GitHub est plus adapté car il met mieux en avant le code et parceque, soyons franc, tout les devs ont un compte GitHub.</li>
<li>Si votre projet est fermé, Bitbucket propose une tarification qui peut s'avérer plus intéréssante.</li>
</ul>
<p>Le mieux reste encore de tester les 2 services pour vous faire votre propre opinion.</p>
            </div>

<a name="8"></a>
# Nommer ses commits
<div class="formatted">
              <p>Nommer les choses n'est jamais facile et les commits de git n'échappent pas à la règle. Le problème d'un mauvais nommage est qu'il est ensuite difficile de retrouver un commit spécifique et il est donc important de trouver une convention particulière pour bien s'organiser.</p>

<h2>Le format</h2>
<pre class="with-syntax"><code class="hljs xml"><span class="hljs-tag">&lt;<span class="hljs-name">type</span>&gt;</span>(<span class="hljs-tag">&lt;<span class="hljs-name">portée</span>&gt;</span>): <span class="hljs-tag">&lt;<span class="hljs-name">sujet</span>&gt;</span>

<span class="hljs-tag">&lt;<span class="hljs-name">description</span>&gt;</span>

<span class="hljs-tag">&lt;<span class="hljs-name">footer</span>&gt;</span></code></pre>
<ul>
<li><strong>Type</strong> définit le type de commit
<ul>
<li><strong>build</strong>: Système de build (example : gulp, webpack, npm)</li>
<li><strong>ci</strong>: Intégration continue (example scopes: Travis, Circle, BrowserStack, SauceLabs)</li>
<li><strong>docs</strong>: Documentation</li>
<li><strong>feat</strong>: Ajout d'une fonctionnalité</li>
<li><strong>fix</strong>: Correction de bogue</li>
<li><strong>perf</strong>: Amélioration des performances</li>
<li><strong>refactor</strong>: Changement du code qui ne change rien au fonctionnement</li>
<li><strong>style</strong>: Changement du style du code (sans changer la logique)</li>
<li><strong>test</strong>: Modification des tests</li>
</ul></li>
<li><strong>Portée</strong> définit quelle partie de votre librairie / application est affectée par le commit (cette information est optionnelle)</li>
<li><strong>Sujet</strong> contient une description succinte des changements
<ul>
<li>En utilisant l'impératif présent ("change", et non pas "changed" ou "changes")</li>
<li>Sans majuscule au début</li>
<li>Pas de "." à la fin de la description</li>
</ul></li>
<li><strong>Description</strong> permet de détailler plus en profondeur les motivations derrière le changement. Les règles sont les mêmes que pour la partie Sujet.</li>
<li><strong>Footer</strong> contient les changements importants (Breaking Changes) et les références à des issues <a href="https://help.github.com/articles/closing-issues-using-keywords/">GitHub</a> / GitLab ou autre.</li>
</ul>
            </div>