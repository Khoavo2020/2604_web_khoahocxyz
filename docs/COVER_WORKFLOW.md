# Cover Workflow

SVG cover cho bai viet duoc tao tu front matter trong `content/` va template nen theo tung category.

## Thu muc lien quan

- `scripts/generate-covers.py`: script sinh cover SVG
- `_templates/covers/<category>.svg.tpl`: template background theo tung category
- `assets/generated/covers/<category>/<slug>.svg`: file cover duoc sinh ra

## Nguon du lieu

Script lay cac gia tri sau tu front matter cua bai Markdown:

- `title`: tieu de hien thi tren cover
- `section_title`: dong category tren cover
- `hero_image`: duong dan output cua cover

Neu khong co `hero_image`, script se mac dinh ghi ra:

```text
assets/generated/covers/<category>/<slug>.svg
```

## Lenh su dung

Sinh lai toan bo cover:

```powershell
python scripts/generate-covers.py
```

Sinh cover cho mot bai cu the:

```powershell
python scripts/generate-covers.py content/triet-hoc/chu-nghia-khac-ky.md
```

Sinh cover cho mot category:

```powershell
python scripts/generate-covers.py --category triet-hoc
```

## Cach mo rong

1. Tao bai moi trong `content/<category>/<slug>.md`
2. Dat `hero_image` theo convention cover hien tai
3. Chay script generate cover
4. Chay tiep `python scripts/build-markdown.py` neu muon build HTML

## Ghi chu

- Script giu nguyen mau sac/background theo template hien co, chi thay phan text.
- Tieu de duoc tu dong xuong dong de hop layout cover rong `1200x630`.
- Font stack da duoc doi sang nhom font serif/sans-serif pho bien de hien thi tieng Viet on dinh hon.
