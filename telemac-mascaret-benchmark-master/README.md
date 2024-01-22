# telemac-mascaret-benchmark

## How to

### With `git`
```bash
git clone https://gitlab.nicodet.fr/nicogodet/telemac-mascaret-benchmark.git
cd telemac-mascaret-benchmark
./bench.sh
```

### Without `git`
```bash
mkdir telemac-mascaret-benchmark
curl -Ls https://gitlab.nicodet.fr/nicogodet/telemac-mascaret-benchmark/-/archive/master/telemac-mascaret-benchmark-master.tar.gz | tar xvz -C telemac-mascaret-benchmark --strip-components=1
cd telemac-mascaret-benchmark
./bench.sh
```

## Results
La durée de calcul des modèles est fixée à 24 000 secondes à l'exception du modèle de malpasset en pas de temps variable à 4 000 secondes.

![malpasset](https://gitlab.nicodet.fr/nicogodet/telemac-mascaret-benchmark/-/jobs/artifacts/master/raw/malpasset.png?job=postprocess)

![21F010_Oloron](https://gitlab.nicodet.fr/nicogodet/telemac-mascaret-benchmark/-/jobs/artifacts/master/raw/21F010_Oloron.png?job=postprocess)

![19F032_Blagnac](https://gitlab.nicodet.fr/nicogodet/telemac-mascaret-benchmark/-/jobs/artifacts/master/raw/19F032_Blagnac.png?job=postprocess)

![18F111_Tisseo](https://gitlab.nicodet.fr/nicogodet/telemac-mascaret-benchmark/-/jobs/artifacts/master/raw/18F111_Tisseo.png?job=postprocess)

![19F046_Lorgues](https://gitlab.nicodet.fr/nicogodet/telemac-mascaret-benchmark/-/jobs/artifacts/master/raw/19F046_Lorgues.png?job=postprocess)

![17F158_Badaillac](https://gitlab.nicodet.fr/nicogodet/telemac-mascaret-benchmark/-/jobs/artifacts/master/raw/17F158_Badaillac.png?job=postprocess)

![19F105_G6](https://gitlab.nicodet.fr/nicogodet/telemac-mascaret-benchmark/-/jobs/artifacts/master/raw/19F105_G6.png?job=postprocess)

![19F219_Baise](https://gitlab.nicodet.fr/nicogodet/telemac-mascaret-benchmark/-/jobs/artifacts/master/raw/19F219_Baise.png?job=postprocess)

![20F082_Agly](https://gitlab.nicodet.fr/nicogodet/telemac-mascaret-benchmark/-/jobs/artifacts/master/raw/20F082_Agly.png?job=postprocess)
