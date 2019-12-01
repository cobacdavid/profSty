import random
import math
import requests
import imgkit
import shutil

##########################################################
# This is a SO code at this adress:
# https://stackoverflow.com/questions/24852345/hsv-to-rgb-color-conversion
def hsv_to_rgb(h, s, v):
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


def prof_deb_env(nomEnv, options=None):
    if options is None:
        return r"\begin{" + nomEnv + "}"
    else:
        options = ", ".join(options)
        return r"\begin{" + nomEnv + "}[" + options + "]"


def prof_fin_env(nomEnv):
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


def prof_mel_let(mot):
    l = list(mot)
    random.shuffle(l)
    return "".join(l)


def prof_mel_phr(phrase):
    mots = phrase.split()
    phraseReponse = prof_mel_let(mots[0]).capitalize() + " "
    for mot in mots[1:]:
        phraseReponse += prof_mel_let(mot) + " "
    return phraseReponse[:-1]


def prof_est_ent(n, precision=1e-5):
    return abs(n - round(n)) < precision


def prof_Tab_Val(fonction, debut, fin, pas, precision=2):
    # fonction interne à ne pas appeler
    nb = int(1 + (fin - debut) / pas)
    x = debut
    liste = []
    for i in range(nb):
        if prof_est_ent(x):
            x = round(x)
        liste += [x]
        y = round(fonction(x), precision)
        if prof_est_ent(y):
            y = round(y)
        liste += [y]
        x = round(x + pas, precision)
    return liste


def prof_tab_val(fonction, debut, fin, pas,
                 xlabel, ylabel, precision=2):
    passageLigne = "\\\\ \\hline\n"
    liste = prof_Tab_Val(fonction, debut, fin, pas, precision)
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
    return prof_deb_env("tabular") + formatage + "\n" +\
        X + Y + prof_fin_env("tabular")


def prof_tab_ind(i0, iend, xlabel, ylabel, zlabel):
    passageLigne = "\\\\ \\hline\n"
    longueur = iend - i0 + 1
    s = prof_deb_env("tabular") + \
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
    return s + "\n" + X + Y + Z + prof_fin_env("tabular")


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
    r = ", ".join(resultat[:nb_termes-1])
    r += " et " + resultat[nb_termes-1]
    return r


def prof_oeis_web_A(n, angle=90, dimension="10cm"):
    suite = "A{:06d}".format(n)
    image = suite + '.jpg'
    url = "https://oeis.org/" + suite
    options = {'quiet': ''}
    imgkit.from_url(url, image, options=options)
    code = prof_deb_env("mdframed",
                        options=["roundcorner=10pt",
                                 "linewidth=1bp",
                                 r"frametitle=\textbf{Vue du site }\url{"+url+r"}",
                                 "frametitlebackgroundcolor=gray!30",
                                 "frametitlerule=true"])
    code += prof_deb_env("center")
    code += r"\includegraphics[angle=" + \
        str(angle) + \
        ",width=" + \
        dimension + \
        "]{" + image + "}"
    code += prof_fin_env("center")
    code += prof_fin_env("mdframed")
    return code


##################
###### TRIS ######
##################


def prof_rep_tri_ligne(T, num_ligne, hauteur=1, couleur=False, nombre=True):
    T = T.copy()
    #
    if not couleur:
        couleurs = [(1, 1, 1)] * len(T)
    else:
        couleurs = []
        for i in range(len(T)):
            r, g, b = hsv_to_rgb(i/len(T), 1.0, 1.0)
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
    code = prof_deb_env("tikzpicture", options=["x=.5cm"])
    code += prof_rep_tri_ligne(T,
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
                code += prof_rep_tri_ligne(T,
                                           etape,
                                           hauteur=.5,
                                           couleur=avec_couleur,
                                           nombre=avec_nombre)
                travail = True
        if not travail:
            break
        # etape += 1
        # code += prof_rep_tri_ligne(T, etape)
    code += prof_fin_env("tikzpicture")
    return code


def prof_tri_insertion(T, avec_couleur=False, avec_nombre=True):
    T = T.copy()
    n = len(T)
    etape = 0
    code = prof_deb_env("tikzpicture", options=["x=.5cm"])
    code += prof_rep_tri_ligne(T,
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
            # code += prof_rep_tableau(T)
        T[position] = nombre
        etape += 1
        code += prof_rep_tri_ligne(T,
                                   etape,
                                   hauteur=.5,
                                   couleur=avec_couleur,
                                   nombre=avec_nombre)
    code += prof_fin_env("tikzpicture")
    return code


def prof_tri_selection(T, avec_couleur=False, avec_nombre=True):
    T = T.copy()
    n = len(T)
    etape = 0
    code = prof_deb_env("tikzpicture", options=["x=.5cm"])
    code += prof_rep_tri_ligne(T,
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
        code += prof_rep_tri_ligne(T,
                                   etape,
                                   hauteur=.5,
                                   couleur=avec_couleur,
                                   nombre=avec_nombre)
    code += prof_fin_env("tikzpicture")
    return code

#####
def prof_image_site(url, image, texte="", dimension="10cm"):
    options = {'quiet': ''}
    imgkit.from_url(url, image, options=options)
    code = prof_deb_env("mdframed",
                        options=["roundcorner=10pt",
                                 "linewidth=1bp",
                                 r"frametitle=\textbf{Vue du site }"+texte,
                                 "frametitlebackgroundcolor=gray!30",
                                 "frametitlerule=true"])
    code += prof_deb_env("center")
    code += r"\includegraphics[width=" + \
        dimension + \
        "]{" + image + "}"
    code += prof_fin_env("center")
    code += prof_fin_env("mdframed")
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
