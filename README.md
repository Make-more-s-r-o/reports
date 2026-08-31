# Reporty — Make more

Statické reporty publikované přes GitHub Pages:
**https://make-more-s-r-o.github.io/reports/**

## Přidání reportu

```bash
./deploy.sh <cesta-k-html> <slug>
```

Skript soubor obalí HTML skeletem s `noindex`, commitne a pushne.
Nový report je pak nutné přidat jako řádek do `index.html` (rozcestník).

## Poznámky

- Stránky **nejsou indexované** — `robots.txt` i meta `noindex` v každém reportu.
- Repo je veřejné, takže odkaz funguje komukoli bez přihlášení.
  Nedávej sem nic, co nesmí ven — historie gitu se nemaže.
- Reporty ukazují stav k datu vzniku a nepřepočítávají se.
