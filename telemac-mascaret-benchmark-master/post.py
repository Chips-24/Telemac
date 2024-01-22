# -*- coding: utf-8 -*-
"""
Created on Sat Aug  7 09:05:28 2021

@author: Nicolas Godet
"""

import csv
import glob
import os

import matplotlib.pyplot as plt

from matplotlib.ticker import NullFormatter

MODELES_LIST = {
    "malpasset": {"nodes": 53081},
    "21F010_Oloron": {"nodes": 41493},
    "19F032_Blagnac": {"nodes": 48282},
    "18F111_Tisseo": {"nodes": 67512},
    "19F046_Lorgues": {"nodes": 76362},
    "17F158_Badaillac": {"nodes": 120823},
    "19F105_G6": {"nodes": 166736},
    "19F219_Baise": {"nodes": 287611},
    "20F082_Agly": {"nodes": 414355},
}


class Server:
    def __init__(self, cpu_carac_file, result_file):
        self.cpu_carac_file = cpu_carac_file
        self.result_file = result_file
        self.cpu_name = ""
        self.cpu_number = 0
        self.results = {}

    def getCpu(self):
        with open(self.cpu_carac_file) as file:
            for line in file.readlines():
                carac = line.split(":")
                if carac[0] == "CPU(s)":
                    self.cpu_number = int(carac[1].strip())
                elif carac[0] == "Model name":
                    self.cpu_name = str(carac[1].strip())

    def processResultFile(self):
        with open(self.result_file, "r") as res:
            for line in csv.DictReader(res, delimiter=","):
                if line["Time"].isdigit():
                    self.results.setdefault(line["Model"], {})[
                        int(line["NPROC"])] = int(line["Time"])

    def getResult(self, modele):
        dico = self.results[modele]
        return list(dico.keys()), list(dico.values())


def getServers(path):
    servers = {}
    file_list = sorted(glob.glob(os.path.join(
        path, "*_cpu_carac.log")), key=str.lower)
    for file in file_list:
        result_file = file.replace("_cpu_carac.log", "_results.csv")
        server = Server(file, result_file)
        servers[os.path.basename(file).replace("_cpu_carac.log", "")] = server
        server.getCpu()
        server.processResultFile()
    return servers


def main():
    servers = getServers("results")
    if not servers:
        print("Aucun résutat trouvé.")
        exit()

    for m_name, m_carac in MODELES_LIST.items():
        plt.figure(num=m_name, figsize=[9, 6], dpi=300)
        plt.title("{} - {} noeuds".format(m_name, m_carac["nodes"]))
        plt.xlabel("Nb de threads")
        plt.ylabel("Durée")
        plt.yscale('log')
        plt.xscale('log')

        locs = [60, 120, 300, 600, 1200, 1800, 2700, 3600]
        labels = ["1 min", "2 min", "5 min", "10 min", "20 min", "30 min", "45 min", "1 h"]
        ymax = 3600
        ymin = ymax
        all_t = []

        for server in servers.values():
            try:
                n, t = server.getResult(m_name)
            except KeyError:
                continue
            # Log(0)
            if n[0] == 0:
                n[0] = 1
            plt.plot(n, t, label=server.cpu_name)
            all_t.extend(t)
            if "islcalcx01" in str(server.cpu_name).lower():
                tt = t

        if min(all_t) < 60:
            ymin = min(all_t) // 5 * 5
        else:
            ymin = min(all_t) // 60 * 60

        if max(all_t) > 7200:
            locs.extend([3600, 7200, 14400])
            labels.extend(["1h", "2h", "4h"])
            ymax = 14400
        elif max(all_t) > 3600:
            locs.extend([3600, 7200])
            labels.extend(["1h", "2h"])
            ymax = 7200
        
        # Build perfect line
        n = [1, 50]
        t = [max(tt), max(tt)/50]
        plt.plot(n, t, "--k", label="Le rêve", linewidth=0.5)

        plt.grid(True, which='major', linewidth=1)
        plt.grid(True, which='minor', linewidth=0.25)
        plt.yticks(locs, labels, rotation=45)
        plt.ylim([ymin, ymax])
        ax = plt.gca()
        ax.yaxis.set_minor_formatter(NullFormatter())
        plt.legend(prop={"size":8})
        plt.savefig("{}.png".format(m_name))
        plt.show()


if __name__ == "__main__":
    main()
