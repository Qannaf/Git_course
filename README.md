<div class="container py5" id="content" role="tabpanel" aria-labelledby="tab-content" tabindex="0">

        <div class="layout-sidebar">
          <div class="stack">

            <div class="h2" aria-hidden="true">À propos de ce tutoriel</div>

            
            <div class="formatted">
              <p>Maintenant que nous savons comment installer git nous allons pouvoir entrer dans le vif du sujet.</p>
<h2>config</h2>
<p>Avant de commencer à faire quoi que ce soit il est important de configurer git. Par défaut la configuration est plutôt satisfaisante mais on va devoir configurer les informations nous concernant. Ces informations seront visibles dans l'historique et permettront de savoir plus tard qui à fait quoi.</p>
<pre class="with-syntax"><code class="hljs coffeescript"><span class="hljs-comment"># git config &lt;option&gt; &lt;valeur&gt;</span>
git config --<span class="hljs-built_in">global</span> user.name <span class="hljs-string">"Mon nom"</span>
git config --<span class="hljs-built_in">global</span> user.email <span class="hljs-string">"mon@email.fr"</span></code></pre>
<p>Le drapeau --global permet d'indiquer à git que cette configuration est globale et affectera ainsi tous nos futurs projets.</p>
<h2>init</h2>
<p>La commande <code>git init</code> permet d'initialiser un nouveau dépôt git vide. Cela aura pour effet de créer un dossier <code>.git</code>qui contiendra les informations sur notre versioning. Il ne sera pas possible de versionner sans ce dossier là.</p>
<pre class="with-syntax"><code class="hljs bash"><span class="hljs-built_in">cd</span> <span class="hljs-string">"MON SUPER PROJET"</span>
git init</code></pre>
<h2>status</h2>
<p>Comme son nom l'indique cette commande permet d'obtenir un statut sur l'état de notre versioning. Elle donne un rapide résumé des fichiers qui sont en <em>staging</em> et des fichiers non suivis.</p>
<pre class="with-syntax"><code class="hljs lua">git <span class="hljs-built_in">status</span></code></pre>
<p>N'hésitez pas à abuser de cette commande pour savoir où vous en êtes, ça vous évitera de mauvaises surprises par la suite</p>
<h2>add</h2>
<p>Une particularité de git est son système de staging qui permet de sélectionner les fichiers à suivre lors du prochain commit. Vous pouvez imaginer ça comme une "zone d'attente" ou on va lister les fichiers que l'on souhaite voir enregistrés.</p>
<pre class="with-syntax"><code class="hljs cs">git <span class="hljs-keyword">add</span> &lt;fichier&gt;   <span class="hljs-meta"># Permet de *stage* le fichier</span>
git <span class="hljs-keyword">add</span> &lt;dossier&gt; <span class="hljs-meta"># Stage tout le dossier</span>
git <span class="hljs-keyword">add</span> *.html        <span class="hljs-meta"># Stage tous les fichier finissant par .html</span>
git <span class="hljs-keyword">add</span> --all            <span class="hljs-meta"># Stage tous les fichiers (même les ajouts et les suppressions)</span></code></pre>
<p>Nous verrons dans un prochain chapitre comment retirer les élément de cette zone de <em>staging</em></p>
<h2>commit</h2>
<p>Une fois que la zone de <em>staging</em> est prête on va pourvoir faire notre premier commit. Un commit est une étape dans l'historique de votre projet, étape que l'on va pouvoir identifier avec un message particulier.</p>
<pre class="with-syntax"><code class="hljs sql">git <span class="hljs-keyword">commit</span>  <span class="hljs-comment"># Ouvre un éditeur pour insérer le message de notre commit</span>
git <span class="hljs-keyword">commit</span> -m <span class="hljs-string">"Message pour le commit ^^"</span></code></pre>
<p>On utilisera souvent le drapeau <code>-m</code>qui permettra de spécifier directement le message de notre commit</p>
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
<h2>diff</h2>
<p>La commande diff permet de voir les différences qu'ils existent sur un fichier </p>
<pre class="with-syntax"><code class="hljs properties"><span class="hljs-attr">git</span> <span class="hljs-string">diff </span>
<span class="hljs-attr">git</span> <span class="hljs-string">diff &lt;fichier&gt;</span></code></pre>
<p>Nous montre toutes les différences depuis le dernier commit. En revanche si on veut comparer en partant de ce qui est stage il faudra rajouter <code>--cached</code>ou <code>--staged</code></p>
<p>Il est aussi possible de comparer par rapport à un commit ou 2 commits ensemble</p>
<pre class="with-syntax"><code class="hljs xml">git diff <span class="hljs-tag">&lt;<span class="hljs-name">commit</span>&gt;</span>           # comparera l'état actuel au commit <span class="hljs-tag">&lt;<span class="hljs-name">commit</span>&gt;</span>
git diff <span class="hljs-tag">&lt;<span class="hljs-name">commit</span>&gt;</span>..<span class="hljs-tag">&lt;<span class="hljs-name">commit</span>&gt;</span> # Permet de comparer les fichier entre 2 commits</code></pre>
            </div>

            <comments-area target="585"><div class="comment-area"><div class="comments__title"><skeleton-box text="3 Commentaires"></skeleton-box></div><form class="grid"><div class="form-group "><label for="username">Nom d'utilisateur</label><input name="username" id="username" class="" type="text" required=""></div><div class="full"><div class="form-group "><label for="content">Votre message</label><textarea name="content" id="content" class="" type="textarea" required=""></textarea></div></div><div class="hstack"><button class="btn btn-primary " type="submit">Envoyer</button></div></form><hr><div class="comment-list"><div class="comment"><skeleton-box class="comment__avatar" width="40" height="40" rounded="true"></skeleton-box><div class="comment__meta"><skeleton-box class="comment__author" text="John Doe comm"></skeleton-box><div class="comment_actions"><skeleton-box class="comment__date" text="Il y a 9 mois"></skeleton-box></div></div><skeleton-box class="comment__content" width="921" height="90"></skeleton-box></div><div class="comment"><skeleton-box class="comment__avatar" width="40" height="40" rounded="true"></skeleton-box><div class="comment__meta"><skeleton-box class="comment__author" text="John Doe comm"></skeleton-box><div class="comment_actions"><skeleton-box class="comment__date" text="Il y a 9 mois"></skeleton-box></div></div><skeleton-box class="comment__content" width="921" height="90"></skeleton-box></div><div class="comment"><skeleton-box class="comment__avatar" width="40" height="40" rounded="true"></skeleton-box><div class="comment__meta"><skeleton-box class="comment__author" text="John Doe comm"></skeleton-box><div class="comment_actions"><skeleton-box class="comment__date" text="Il y a 9 mois"></skeleton-box></div></div><skeleton-box class="comment__content" width="921" height="90"></skeleton-box></div></div></div></comments-area>
          </div>
          <div>
            <div class="stack-large">
              <div class="text-right">
                <small class="text-muted">
                  Publié <time-ago time="1425398340">Il y a 6 ans</time-ago>
                </small>
              </div>
              <div>
                <div class="requirements__title">Technologies utilisées</div>
                <div class="list-group">
                                  </div>
              </div>
              <div>
                <div class="flex">
                  <img class="author_avatar" src="/uploads/avatars/1/1.jpg" alt="" style="width: 50px;border-radius: 50px;">
                  <div style="width: 100%; margin-left: 20px;">
                    <strong style="font-weight: bold;">Auteur : </strong><br>
                    <a title="Grafikart" class="author_name" href="/profil/1">Grafikart</a>
                  </div>
                </div>
              </div>
              <div>
                <div class="requirements__title">Partager</div>
                <a href="https://twitter.com/intent/tweet?via=grafikart_fr&amp;tw_p=tweetbutton&amp;url=https%3A%2F%2Fgrafikart.fr%2Ftutoriels%2Finit-config-add-log-585" is="social-share" target="_blank">
                  <img src="/images/social/twitter.svg" alt="">
                </a>
                <a href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fgrafikart.fr%2Ftutoriels%2Finit-config-add-log-585" is="social-share" target="_blank">
                  <img src="/images/social/facebook.svg" alt="">
                </a>
              </div>
              <div class="stack" style="--gap:1;">
                <div>
                  <a href="/revision/585" class="btn-secondary">
                    <svg class="icon icon-edit">
  <use xlink:href="/sprite.svg?logo#edit"></use>
</svg>
                    Proposer une correction
                  </a>
                </div>
                <mark-as-watched data-history="585" content-id="585"></mark-as-watched>
                <admin-edit hidden=""></admin-edit>
              </div>
            </div>
          </div>
        </div>
      </div>