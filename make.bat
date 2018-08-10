@echo off


IF /I "%1"=="organic" (
	SET name="OrganicChem"
)

IF /I "%1"=="inorganic" (
	SET name="InorganicChem"
)

IF /I "%1"=="physical" (
	SET name="PhysicalChem"
)

IF /I "%1"=="appendix" (
	SET name="Appendix"
)

:again
(call )
cd %name%

cls
lualatex --interaction=nonstopmode --halt-on-error --shell-escape %name%.tex
cp %name%.pdf ../

set /p dummy=

cd ..

goto again