import random
import math
import requests
import imgkit
import shutil
import dvtDecimal as dvt
import abrviz as abr


##########################################################
# This is a SO code at this adress:
# https://stackoverflow.com/questions/24852345/hsv-to-rgb-color-conversion
def __hsvto_rgb(h, s, v):
    if s == 0.0:
        v *= 255
        return (v, v, v)
    i = int(h * 6.) # XXX assume int() truncates!
    f = (h * 6.) - i
    p, q, t = int(255*(v*(1.-s))),\
        int(255*(v*(1.-s*f))),\
        int(255*(v*(1.-s*(1-f))))
    v *= 255
    i %= 6
    if i == 0: return (v, t, p)
    if i == 1: return (q, v, p)
    if i == 2: return (p, v, t)
    if i == 3: return (p, q, v)
    if i == 4: return (t, p, v)
    if i == 5: return (v, p, q)
############################################################


def __prof_deb_env(nomEnv, options=None):
    if options is None:
        return r"\begin{" + nomEnv + "}"
    else:
        options = ", ".join(options)
        return r"\begin{" + nomEnv + "}[" + options + "]"


def __prof_fin_env(nomEnv):
    return r"\end{" + nomEnv + "}"


def prof_dec_let(mot):
    l = list(mot)
    s = r"\mbox{"
    for i in l[:-1]:
        s += str(i) + r"\hspace{"
        s += str(round((random.random() - .5) * 1.5, 2))
        s += "ex}"
        s += r"\raisebox{"
        s += str(round(random.random() - .5, 2))
        s += "ex}"
    s += l[-1] + "}"
    return s


def prof_mel_mot(mot):
    l = list(mot)
    random.shuffle(l)
    return "".join(l)


def prof_mel_phr(phrase):
    mots = phrase.split()
    phraseReponse = prof_mel_mot(mots[0]).capitalize() + " "
    for mot in mots[1:]:
        phraseReponse += prof_mel_mot(mot) + " "
    return phraseReponse[:-1]


def __prof_est_ent(n, precision=1e-5):
    return abs(n - round(n)) < precision


def __prof_Tab_Val(fonction, debut, fin, pas, precision=2):
    # fonction interne à ne pas appeler
    nb = int(1 + (fin - debut) / pas)
    x = debut
    liste = []
    for i in range(nb):
        if __prof_est_ent(x):
            x = round(x)
        liste += [x]
        y = round(fonction(x), precision)
        if __prof_est_ent(y):
            y = round(y)
        liste += [y]
        x = round(x + pas, precision)
    return liste


def prof_tab_val(fonction, debut, fin, pas,
                 xlabel, ylabel, precision=2):
    passageLigne = "\\\\ \\hline\n"
    liste = __prof_Tab_Val(fonction, debut, fin, pas, precision)
    longueur = round(len(liste) / 2)
    l = iter(liste)
    X = "\\hline\n" + xlabel + "&"
    Y = ylabel + "&"
    for i in l:
        X += r"\nombre{" + f"{i}" + "} &"
        Y += r"\nombre{" + f"{next(l)}" + "} &"
    X = X[:-1] + passageLigne
    Y = Y[:-1] + passageLigne
    formatage = "{|c||*{" + str(longueur) + "}{c|}}"
    return __prof_deb_env("tabular") + formatage + "\n" +\
        X + Y + __prof_fin_env("tabular")


def prof_tab_ind(iend, xlabel, ylabel, zlabel):
    passageLigne = "\\\\ \\hline\n"
    longueur = iend + 1
    s = __prof_deb_env("tabular") + \
        "{|c||*{" + str(longueur) + "}{c|}}"
    X = "\\hline\n" + xlabel + "&"
    Y = ylabel + "&"
    Z = zlabel + "&"
    for i in range(longueur):
        X += r" $" + str(i) + "$ &"
        Y += r" &"
        negatif = i - longueur
        Z += r" $" + str(negatif) + "$ &"
    X = X[:-1] + passageLigne
    Y = Y[:-1] + passageLigne
    Z = Z[:-1] + passageLigne
    return s + "\n" + X + Y + Z + __prof_fin_env("tabular")


##################
###### OEIS ######
##################

def prof_oeis_A(n, nb_termes=10):
    url = "https://oeis.org/search?q=A" + \
        "{:06d}".format(n) + \
        "&fmt=json"
    reponse = requests.get(url)
    resultat = reponse.json()['results'][0]['data']
    resultat = resultat.split(',')[:nb_termes]
    r = ", ".join(resultat[:nb_termes - 1])
    r += " et " + resultat[nb_termes - 1]
    return r


def prof_oeis_web_A(n, angle=90, dimension="10cm"):
    suite = "A{:06d}".format(n)
    image = suite + '.jpg'
    url = "https://oeis.org/" + suite
    options = {'quiet': ''}
    imgkit.from_url(url, image, options=options)
    code = __prof_deb_env("mdframed",
                        options=["roundcorner=10pt",
                                 "linewidth=1bp",
                                 r"frametitle=\textbf{Vue du site }\url{"+url+r"}",
                                 "frametitlebackgroundcolor=gray!30",
                                 "frametitlerule=true"])
    code += __prof_deb_env("center")
    code += r"\includegraphics[angle=" + \
        str(angle) + \
        ",width=" + \
        dimension + \
        "]{" + image + "}"
    code += __prof_fin_env("center")
    code += __prof_fin_env("mdframed")
    return code


##################
###### TRIS ######
##################


def __prof_rep_tri_ligne(T, num_ligne, hauteur=1, couleur=False, nombre=True):
    T = T.copy()
    #
    if not couleur:
        couleurs = [(1, 1, 1)] * len(T)
    else:
        couleurs = []
        for i in range(len(T)):
            r, g, b = __hsvto_rgb(i/len(T), 1.0, 1.0)
            nuance = [round(c/255, 2) for c in [r, g, b]]
            couleurs.append(nuance)
    #
    code_tikz = ""
    for i in range(len(T)):
        r, g, b = couleurs[T[i]]
        code_tikz += r"\definecolor{macouleur}{rgb}{" + \
            str(r) + "," + str(g) + "," + str(b) + r"}"
        code_tikz += r"""\filldraw[fill=macouleur""" + \
            r""", draw=black] (""" + \
            str(i) + \
            r""",-""" + \
            str(num_ligne*hauteur) + \
            r""") rectangle (""" + \
            str(i+1) + \
            r""",""" + \
            str(-num_ligne*hauteur+hauteur) + \
            """);"""
        if nombre:
            code_tikz += r"\node at (" + \
                str(i+.5) + \
                "," + \
                str(-num_ligne*hauteur+hauteur/2) + \
                ") {" + \
                str(T[i]) + \
                "};"
    return code_tikz


def prof_tri_bulle(T, avec_couleur=False, avec_nombre=True):
    T = T.copy()
    n = len(T)
    etape = 0
    code = __prof_deb_env("tikzpicture", options=["x=.5cm"])
    code += __prof_rep_tri_ligne(T,
                               etape,
                               hauteur=.5,
                               couleur=avec_couleur,
                               nombre=avec_nombre)
    for i in range(n-1):
        travail = False
        for j in range((n-1) - i):
            if T[j] > T[j+1]:
                T[j], T[j+1] = T[j+1], T[j]
                etape += 1
                code += __prof_rep_tri_ligne(T,
                                           etape,
                                           hauteur=.5,
                                           couleur=avec_couleur,
                                           nombre=avec_nombre)
                travail = True
        if not travail:
            break
        # etape += 1
        # code += __prof_rep_tri_ligne(T, etape)
    code += __prof_fin_env("tikzpicture")
    return code


def prof_tri_insertion(T, avec_couleur=False, avec_nombre=True):
    T = T.copy()
    n = len(T)
    etape = 0
    code = __prof_deb_env("tikzpicture", options=["x=.5cm"])
    code += __prof_rep_tri_ligne(T,
                               etape,
                               hauteur=.5,
                               couleur=avec_couleur,
                               nombre=avec_nombre)
    for i in range(1, n):
        nombre = T[i]
        position = i
        while position > 0 and T[position-1] > nombre:
            T[position] = T[position-1]
            position -= 1
            # code += __prof_rep_tableau(T)
        T[position] = nombre
        etape += 1
        code += __prof_rep_tri_ligne(T,
                                   etape,
                                   hauteur=.5,
                                   couleur=avec_couleur,
                                   nombre=avec_nombre)
    code += __prof_fin_env("tikzpicture")
    return code


def prof_tri_selection(T, avec_couleur=False, avec_nombre=True):
    T = T.copy()
    n = len(T)
    etape = 0
    code = __prof_deb_env("tikzpicture", options=["x=.5cm"])
    code += __prof_rep_tri_ligne(T,
                               etape,
                               hauteur=.5,
                               couleur=avec_couleur,
                               nombre=avec_nombre)
    for i in range(n-1):
        position = i
        for j in range(i+1, n):
            if T[j] < T[position]:
                position = j
        T[position], T[i] = T[i], T[position]
        etape += 1
        code += __prof_rep_tri_ligne(T,
                                   etape,
                                   hauteur=.5,
                                   couleur=avec_couleur,
                                   nombre=avec_nombre)
    code += __prof_fin_env("tikzpicture")
    return code


###
def prof_image_site(url, image, texte="", dimension="10cm", **kwargs):
    kwargs = kwargs if kwargs else {}
    kwargs['quiet'] = ''
    imgkit.from_url(url, image, options=kwargs)
    code = __prof_deb_env("mdframed",
                          options=["roundcorner=10pt",
                                   "linewidth=1bp",
                                   r"frametitle=\textbf{Vue du site }"+texte,
                                   "frametitlebackgroundcolor=gray!30",
                                   "frametitlerule=true"])
    code += __prof_deb_env("center")
    code += r"\includegraphics[width=" + dimension + "]{" + image + "}"
    code += __prof_fin_env("center")
    code += __prof_fin_env("mdframed")
    return code

# https://stackoverflow.com/questions/13137817/how-to-download-image-using-requests#13137873
# https://stackoverflow.com/questions/34311747/whats-the-url-to-download-map-tiles-from-google-maps#37269293
# def prof_charge_tile(zoom, lon_deg, lat_deg):
#     sec = lambda x:1/math.cos(x)
#     lat_rad = math.radians(lat_deg)
#     n = 2 ** zoom
#     xtile = n * ((lon_deg + 180) // 360)
#     ytile = n * (1 - (math.log(math.tan(lat_rad)
#                                + sec(lat_rad)) / math.pi)) / 2
#     # return xtile, ytile, zoom
#     reponse = requests.get("http://mt1.google.com/vt/lyrs=y&x=" + str(round(xtile)) + "&y=" + str(round(ytile)) + "&z=" + str(zoom), stream=True)
#     with open('img.jpg', 'wb') as out_file:
#         shutil.copyfileobj(reponse.raw, out_file)
#     return reponse


## recherche textuelle
def prof_tableau_texte_ligne(texte,
                             hauteur=0.5,
                             match=None,
                             mismatch=None,
                             num_ligne=0,
                             eleve=False):
    #
    couleurs = [(1, 1, 1)] * len(texte)
    couleurs_texte = [(0, 0, 0)] * len(texte)
    if match is not None and not eleve:
        for i in match:
            couleurs[i] = (.5, 1, .5)
            couleurs_texte[i] = (1, 1, 1)
    if mismatch is not None and not eleve:
        for i in mismatch:
            couleurs[i] = (1, .5, .5)
        
    #
    nb_vide = 0
    while texte[nb_vide] == " ":
        nb_vide += 1
    #
    # grand rectangle gauche : le pousseur
    code_tikz = r"""\draw[color=black] (0,-""" + \
        str(num_ligne*hauteur) + """)""" + \
        r""" rectangle (""" + \
        str(nb_vide) + \
        r""",""" + \
        str(-num_ligne*hauteur+hauteur) + \
        """);"""
    #
    # les cases remplies
    for i in range(nb_vide, len(texte)):
        r, g, b = couleurs[i]
        code_tikz += r"\definecolor{macouleurfond}{rgb}{" + \
            str(r) + "," + str(g) + "," + str(b) + r"}"
        code_tikz += r"""\filldraw[fill=macouleurfond""" + \
            r""", draw=black] (""" + \
            str(i) + \
            r""",-""" + \
            str(num_ligne*hauteur) + \
            r""") rectangle (""" + \
            str(i+1) + \
            r""",""" + \
            str(-num_ligne*hauteur+hauteur) + \
            """);"""
        r, g, b = couleurs_texte[i]
        code_tikz += r"\definecolor{macouleurtexte}{rgb}{" + \
            str(r) + "," + str(g) + "," + str(b) + r"}"
        code_tikz += r"\node[color=macouleurtexte] at (" + \
            str(i+.5) + \
            "," + \
            str(-num_ligne*hauteur+hauteur/2) + \
            ") {" + \
            str(texte[i]) + \
            "};"
    return code_tikz


# mauvais caractère 
def __prof_tableau_MC(M):
    # analyse du motif
    # tableau de décalage
    # mauvais caractère
    m = len(M)
    mc = {}
    # mc[M[m-1]] = 1
    for i in range(1, m):
        car_motif = M[m-i-1]
        if car_motif not in mc:
            mc[car_motif] = i
    return mc


def prof_BM_mc(T, M, eleve=False):
    mc = __prof_tableau_MC(M)
    m = len(M)
    #
    nb_match = 0
    position = m - 1
    code_sortie = "\\noindent"
    while position < len(T):
        # print(T)
        # print(" " * (position-m+1) + M)
        i = 0
        while m-i-1 >= 0 and T[position-i] == M[m-i-1]:
            i += 1
        #
        if i == m:
            # print("** match **")
            nb_match += 1
            decalage = mc[T[position]]
            match = range(position-m+1, position+1)
            matchm = []
            mismatch = []
        else:
            # le decalage n'est pas forcément la longueur du motif
            # ou le nombre lu dans le tableau MC car on peut avoir
            # matché une partie de l'expression
            match = range(position, position-i, -1)
            matchm = []
            mismatch = [position-i]
            # cas d'un caractère texte dans
            # la suite du motif
            ## à faire !! pour l'instant que le dernier
            # non matchant est testé comme présent dans le motif
            if T[position-i] in mc:
                decalage = mc[T[position-i]] - i
                matchm += [position-decalage]
            else:
                decalage = m - i
        position += decalage
        #
        code_sortie += __prof_deb_env("tikzpicture", options=["x=.25cm, y=.5cm"])
        code_sortie += prof_tableau_texte_ligne(T,
                                                num_ligne=0,
                                                match=match,
                                                mismatch=mismatch,
                                                eleve=eleve) + "\n"
        if eleve:
            code_sortie += "\draw[draw=none] (0, 0) rectangle (1, -.7);\n" 
        else:
            code_sortie += prof_tableau_texte_ligne(
                " " * (position - decalage - m + 1) + M,
                num_ligne=1,
                match=list(match) + matchm,
                mismatch=mismatch,
                eleve=eleve) + "\n"
        code_sortie += __prof_fin_env("tikzpicture") + "\\\\"
        #

    #
    # return str(nb_match) + " correspondance(s) exacte(s)"
    return code_sortie


# construction arbre binaire


# def prof_arbre_binaire(arbre, cercle=True, flechage=False, code_supp=""):
#     code_forest = r"""\tikzset{
#     arete/.style={draw,
#     very thick,
#     color=black!80
#     }
#     }
#     """
#     code_forest += r"""\forestset{%
#         default preamble={%
#         for tree={"""
#     code_forest += r"font=\bfseries,edge={arete}"
#     if cercle:
#         code_forest += ",circle, draw, very thick, rotate=1"
#     if flechage:
#         code_forest += ",edge=->"
#     code_forest += r"}}}"
#     code_forest += __prof_deb_env("forest")
#     structure = " ".join(str(arbre).split(', '))
#     structure = structure.replace("[]", "[,phantom]")
#     structure = structure.replace('"', "")
#     structure = structure.replace("'", "")

#     code_forest += structure
#     code_forest += code_supp
#     code_forest += __prof_fin_env("forest")
#     return code_forest


# # construction arbre binaire
# def prof_arbre_bin(arbre, cercle=True, flechage=False, code_supp=""):
#     code_forest = r"""\tikzset{
#     arete/.style={draw,
#     very thick,
#     color=black!80
#     }
#     }
#     """
#     structure = " ".join(str(arbre).split(', '))
#     structure = structure.replace("[]", "[,phantom]")
#     structure = structure.replace('"', "")
#     structure = structure.replace("'", "")

#     code_forest += structure
#     code_forest += code_supp
#     code_forest += __prof_fin_env("forest")
#     return code_forest

class noeud:
    def __init__(self, etiq, gauche=None, droit=None):
        self.etiquette = etiq
        self.gauche = gauche
        self.droit = droit

    def get_gauche(self):
        return self.gauche

    def get_droite(self):
        return self.droit

    def get_etiquette(self):
        return self.etiquette

    def est_feuille(self):
        return self.gauche is None and self.droit is None

    def get_hauteur(self):
        g = 0 if self.gauche is None else self.gauche.get_hauteur()
        d = 0 if self.droit is None else self.droit.get_hauteur()
        return 1 + max(g, d)

    # def to_list_forest(self):
    #     if self.est_feuille():
    #         return list([self.etiquette])
    #     else:
    #         if self.gauche is not None \
    #            and self.droit is not None:
    #             g = [self.gauche] if isinstance(self.gauche, int) \
    #                 else self.gauche.to_list()
    #             d = [self.droit] if isinstance(self.droit, int) \
    #                 else self.droit.to_list()
    #             return [self.etiquette, g, d]
    #         elif self.gauche is not None:
    #             g = [self.gauche] if isinstance(self.gauche, int) \
    #                 else self.gauche.to_list()
    #             d = list([',phantom'])
    #             return [self.etiquette, g, d]
    #         elif self.droit is not None:
    #             g = list([',phantom'])
    #             d = [self.droit] if isinstance(self.droit, int) \
    #                 else self.droit.to_list()
    #             return [self.etiquette, g, d]
    #         else:
    #             return [self.etiquette, [], []]

    def _feuille(valeur):
        return "node{" + str(valeur) + "}"

    def _parent(valeur, gauche, droite, nb):
        if gauche != "[missing]":
            delmg_g = "child{"
            delmg_d = "} "
        else:
            delmg_g = "child "
            delmg_d = " "
        #
        if droite != "[missing]":
            delmd_g = "child{"
            delmd_d = "} "
        else:
            delmd_g = "child "
            delmd_d = " "
        #
        return "node{" + str(valeur) + "} " + \
            delmg_g + gauche + delmg_d + \
            "child [missing]" * (nb - 1) + \
            delmd_g + droite + delmd_d

    def to_tikz(self, h):
        #
        manquant = "[missing]"
        #
        if self.est_feuille():
            return noeud._feuille(self.etiquette)
        else:
            if self.gauche is not None \
               and self.droit is not None:
                g = noeud._feuille(self.gauche) \
                    if isinstance(self.gauche, int) \
                    else self.gauche.to_tikz(h // 2)
                d = noeud._feuille(self.droit) \
                    if isinstance(self.droit, int) \
                    else self.droit.to_tikz(h // 2)
                return noeud._parent((self.etiquette), g, d, h)
            elif self.gauche is not None:
                g = noeud._feuille(self.gauche) \
                    if isinstance(self.gauche, int) \
                    else self.gauche.to_tikz(h // 2)
                return noeud._parent(self.etiquette, g, manquant, h)
            elif self.droit is not None:
                d = noeud._feuille(self.droit) \
                    if isinstance(self.droit, int) \
                    else self.droit.to_tikz(h // 2)
                return noeud._parent(self.etiquette, manquant, d, h)
            else:
                return noeud._parent(self.etiquette, manquant, manquant, h)

    def __repr__(self):
        h = self.get_hauteur()
        return "\\" + str(self.to_tikz(2 ** (h - 2))) + ";"


def prof_arbre_binaire(arbre, *opt):
    o = ""
    for s in opt:
        o += ',' + str(s)
    code_tikz = __prof_deb_env("tikzpicture",
                               options=["nodes={draw, circle, thick}" + o])
    code_tikz += arbre.__repr__()
    code_tikz += __prof_fin_env("tikzpicture")
    return code_tikz


def _arbre_binaire_complet(hauteur, etiquette):
    if hauteur == 0:
        return "None"
    return f"noeud({etiquette}," + \
        _arbre_binaire_complet(hauteur - 1, 2 * etiquette) + "," + \
        _arbre_binaire_complet(hauteur - 1, 2 * etiquette + 1) + ")"


def prof_arbre_binaire_complet(hauteur, *options):
    arbre = eval(_arbre_binaire_complet(hauteur + 1, 1))
    return prof_arbre_binaire(arbre, *options)

#################
###### ABR ######
#################


def prof_abr(T, nom_sortie, largeur):
    a = abr.Arbre()
    for e in T:
        a.inserer(abr.Noeud(e))

    a.sortie(a.racine, nom_sortie, "png")

    code = r"\includegraphics[width=" + largeur + "]" +\
        "{" + nom_sortie + ".png}"
    return code


### Arbres probabilités ###
def prof_arbre_bernoulli(prof, evt, p_evt, fraction=True, echelle=1):
    # aspect numérique
    if fraction:
        proba = dvt.dvtDecimal(p_evt)
        proba = dvt.dvtDecimal(*proba.simpValues)
        proba_txt = proba.toTeX()[0]
        n_proba = 1 - proba
        n_proba_txt = n_proba.toTeX()[0]
    else:
        proba_txt = f"\\nombre{{{p_evt}}}"
        n_proba = 1 - float(p_evt)
        n_proba_txt = f"\\nombre{{{n_proba}}}"
    # texte des noeuds
    if evt == "...":
        evt = n_evt_txt = "\\dots"
    else:
        n_evt_txt = f"$\\overline {evt}$"
    # couleur proba
    coul_proba = "black"

    # style level
    sd = [.5*2**i for i in range(prof)][::-1]
    lvl_sty = ""
    for p in range(prof):
        lvl_dist = 1 if p == 0 else 1.5
        sbg_dist = sd[p] # 2 ** (prof - p - 1)
        lvl_sty += f"level {p+1}/.style={{level distance={lvl_dist}cm,\
sibling distance={sbg_dist}cm}}," + "\n"
    # node style
    nd_sty = f"nodS/.style={{node contents=${evt}$}},"\
        + "\n" + f"nodE/.style={{node contents={n_evt_txt}}},"
    # etiq style
    if fraction:
        et_sty = f"etiqS/.style={{left=-1mm,{coul_proba},\
node contents=$\\scriptstyle{proba_txt}$}},"\
            + "\n" + f"etiqE/.style={{right=-1mm,{coul_proba},\
node contents=$\\scriptstyle{n_proba_txt}$}}"
    else:
        et_sty = f"etiqS/.style={{{coul_proba},\
node contents=$\\scriptstyle{proba_txt}$}},"\
            + "\n" + f"etiqE/.style={{{coul_proba},\
node contents=$\\scriptstyle{n_proba_txt}$}}"

    return r"\begin{tikzpicture}" + "\n[" + \
        f"scale={echelle}," +\
        lvl_sty +\
        nd_sty + "\n" + \
        et_sty + "]\n" + \
        r"\node{} [grow'=right]" + "\n" + _prof_arbre_bernoulli(prof) + "\n;" + \
        r"\end{tikzpicture}" + "\n"


def _prof_arbre_bernoulli(prof):
    if prof == 0:
        return ""
    else:
        return """\nchild { node[nodS] {}""" + \
            _prof_arbre_bernoulli(prof-1) + \
            """\nedge from parent[help lines] node[etiqS]}
            child { node[nodE] {}""" + \
            _prof_arbre_bernoulli(prof-1) + \
            """\nedge from parent[help lines] node[etiqE]}"""
