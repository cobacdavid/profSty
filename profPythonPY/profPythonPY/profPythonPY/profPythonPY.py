import random
import math


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


def prof_mel_phr(phrase):
    mots = phrase.split()
    phraseReponse = prof_mel_let(mots[0]).capitalize() + " "
    for mot in mots[1:]:
        phraseReponse += prof_mel_let(mot) + " "
    return phraseReponse[:-1]


def prof_mel_let(mot):
    l = list(mot)
    random.shuffle(l)
    return "".join(l)


def prof_est_ent(n, precision=1e-5):
    return abs(n - round(n)) < precision


def prof_Tab_Val(fonction, debut, fin, pas, precision=2):
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


def prof_rep_tri_ligne(T, num_ligne, hauteur=1):
    T = T.copy()
    # code_tikz = r"""\foreach \i in {0,...,""" + str(len(T)-1) + "}\n" + \
    #     r"""\filldraw[fill=white, draw=black] (\i,-""" + str(num_ligne*hauteur) + \
    #     r""") rectangle (\i+1,""" + str(-num_ligne*hauteur+hauteur) + """);"""
    code_tikz = ""
    for i in range(len(T)):
        code_tikz += r"""\filldraw[fill=white, draw=black] (""" + \
            str(i) + \
            r""",-""" + \
            str(num_ligne*hauteur) + \
            r""") rectangle (""" + \
            str(i+1) + \
            r""",""" + \
            str(-num_ligne*hauteur+hauteur) + \
            """);"""
        code_tikz += r"\node at (" + \
            str(i+.5) + \
            "," + \
            str(-num_ligne*hauteur+hauteur/2) + \
            ") {" + \
            str(T[i]) + \
            "};"
    return code_tikz


def prof_tri_bulle(T):
    T = T.copy()
    n = len(T)
    etape = 0
    code = prof_deb_env("tikzpicture", options=["x=.5cm"])
    code += prof_rep_tri_ligne(T, etape, hauteur=.5)
    for i in range(n-1):
        travail = False
        for j in range((n-1) - i):
            if T[j] > T[j+1]:
                T[j], T[j+1] = T[j+1], T[j]
                etape += 1
                code += prof_rep_tri_ligne(T, etape, hauteur=.5)
                travail = True
        if not travail:
            break
        # etape += 1
        # code += prof_rep_tri_ligne(T, etape)
    code += prof_fin_env("tikzpicture") + r"\\"
    return code


def prof_tri_insertion(T):
    T = T.copy()
    n = len(T)
    etape = 0
    code = prof_deb_env("tikzpicture", options=["x=.5cm"])
    code += prof_rep_tri_ligne(T, etape)
    for i in range(1, n):
        nombre = T[i]
        position = i
        while position > 0 and T[position-1] > nombre:
            T[position] = T[position-1]
            position -= 1
            # code += prof_rep_tableau(T)
        T[position] = nombre
        etape += 1
        code += prof_rep_tri_ligne(T, etape)
    code += prof_fin_env("tikzpicture") + r"\\"
    return code


def prof_tri_selection(T):
    T = T.copy()
    n = len(T)
    etape = 0
    code = prof_deb_env("tikzpicture", options=["x=.5cm"])
    code += prof_rep_tri_ligne(T, etape)
    for i in range(n-1):
        position = i
        for j in range(i+1, n):
            if T[j] < T[position]:
                position = j
        T[position], T[i] = T[i], T[position]
        etape += 1
        code += prof_rep_tri_ligne(T, etape)
    code += prof_fin_env("tikzpicture") + r"\\"
    return code


# print(tableau_indice(0, 11, "Indice positif", "Chaîne", "Indice négatif"))
