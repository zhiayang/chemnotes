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

cd %name%

:again

cls
lualatex --interaction=nonstopmode --halt-on-error --shell-escape %name%.tex
mv %name%.pdf ../

set /p dummy=

goto again
cd ..