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
set isquit=""

(call )
cd %name%

cls
lualatex --interaction=nonstopmode --halt-on-error --shell-escape %name%.tex
cp %name%.pdf ../

echo.
set /p isquit= "q to quit / enter to recompile: "

IF /I "%isquit%"=="q" (
	echo "i am q"
	goto doquit
)

cd ..

goto again

:doquit
cd ..
set isquit=""