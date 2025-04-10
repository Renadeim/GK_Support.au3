#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
<REDACTED>
<REDACTED>
<REDACTED>
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

 AutoIt Version: <REDACTED>
 Author:         Christian <REDACTED>

 Script Function:
	Optimize Workroutine GK, ECT-MZ-TK Support

#ce ----------------------------------------------------------------------------
; Script Start - Add your code below here:

#include <GuiConstants.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <String.au3>
#include <File.au3>
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#include <array.au3>
#include <Mail-Versand.au3>
#include <Crypt.au3>
#include <date.au3>
#include <GuiEdit.au3>
#include <GuiStatusBar.au3>
#include <GuiListBox.au3>
#include <_SQL_Netto.au3>
#include <ADO.au3>
#include <Misc.au3>
#include <ColorConstants.au3>
#include <FontConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>
#include <ButtonConstants.au3>
#include <Process.au3>
#include <Inet.au3>
#include <Json.au3>

AutoItSetOption('GUIOnEventMode', 1)

#Region GLOBAL VARIABLES
Global $iW = 830, $iH = 400, $iT = 52, $iB = 52, $iLeftWidth = 150, $iGap = 10, $hMainGUI
Global $Letzter_Eintrag = _FileListToArray(@ScriptDir & "<REDACTED>", "*.txt")
_ArraySort($Letzter_Eintrag)
;~ _ArrayDisplay($Letzter_Eintrag)
Global $Aufgabeninhalt = FileRead(@ScriptDir & "<REDACTED>\" & $Letzter_Eintrag[UBound($Letzter_Eintrag) - 1])
$Hashwert_start = _Crypt_HashData(@ScriptDir & "<REDACTED>\" & $Letzter_Eintrag[UBound($Letzter_Eintrag) - 1], $CALG_MD5)
#EndRegion GLOBAL VARIABLES

#Region definition der Userform
Local $hFooter, $nMsg, $aPos
Local $iLinks = 14
Local $sMainGuiTitle = "GK, ECT-MZ-TK Support v" & FileGetVersion(@ScriptDir & "<REDACTED>")
Local $sHeader = "#OptimizeYourWork"
Local $sFooter = "Programme GK-Support"
Local $aLink[$iLinks], $aPanel[$iLinks]
$aLink[0] = $iLinks - 1
$aPanel[0] = $iLinks - 1
$hMainGUI = GUICreate($sMainGuiTitle, $iW, $iH, -1, -1, BitOR($GUI_SS_DEFAULT_GUI, $WS_SYSMENU))
GUISetIcon("shell32.dll", -42, $hMainGUI)

GUICtrlCreateLabel($sHeader, 48, 8, 175, 36, $SS_CENTERIMAGE)
GUICtrlSetFont(-1, 14, 800, 0, "Arial", 5)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)

GUICtrlCreateGroup("Online", 230, 5, 265, 42.5)
GUICtrlSetFont(-1, 8.5, 300, 2, "Arial", 5)

$Christian = GUICtrlCreateLabel("CG", 240, 22.5, 20, 16, BitOR($SS_CENTER, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetFont(-1, 8.5, 300, 2, "Arial", 5)
GUICtrlSetBkColor(-1, 0xFF0000)
$Daniel = GUICtrlCreateLabel("DB", 265, 22.5, 20, 16, BitOR($SS_CENTER, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetFont(-1, 8.5, 300, 2, "Arial", 5)
GUICtrlSetBkColor(-1, 0xFF0000)
$Sabrina = GUICtrlCreateLabel("SD", 290, 22.5, 20, 16, BitOR($SS_CENTER, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetFont(-1, 8.5, 300, 2, "Arial", 5)
GUICtrlSetBkColor(-1, 0xFF0000)
$Herbert = GUICtrlCreateLabel("HD", 315, 22.5, 20, 16, BitOR($SS_CENTER, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetFont(-1, 8.5, 300, 2, "Arial", 5)
GUICtrlSetBkColor(-1, 0xFF0000)
$TomF = GUICtrlCreateLabel("TF", 340, 22.5, 20, 16, BitOR($SS_CENTER, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetFont(-1, 8.5, 300, 2, "Arial", 5)
GUICtrlSetBkColor(-1, 0xFF0000)
$Andreas = GUICtrlCreateLabel("AG", 365, 22.5, 20, 16, BitOR($SS_CENTER, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetFont(-1, 8.5, 300, 2, "Arial", 5)
GUICtrlSetBkColor(-1, 0xFF0000)
$Stephan = GUICtrlCreateLabel("SH", 390, 22.5, 20, 16, BitOR($SS_CENTER, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetFont(-1, 8.5, 300, 2, "Arial", 5)
GUICtrlSetBkColor(-1, 0xFF0000)
$Julia = GUICtrlCreateLabel("JK", 415, 22.5, 20, 16, BitOR($SS_CENTER, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetFont(-1, 8.5, 300, 2, "Arial", 5)
GUICtrlSetBkColor(-1, 0xFF0000)
$Maximilian = GUICtrlCreateLabel("MM", 440, 22.5, 20, 16, BitOR($SS_CENTER, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetFont(-1, 8.5, 300, 2, "Arial", 5)
GUICtrlSetBkColor(-1, 0xFF0000)
$Tobias = GUICtrlCreateLabel("TR", 465, 22.5, 20, 16, BitOR($SS_CENTER, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetFont(-1, 8.5, 300, 2, "Arial", 5)
GUICtrlSetBkColor(-1, 0xFF0000)

GUICtrlCreateGroup("GK-Support", 500, 5, 100, 42.5)
GUICtrlSetFont(-1, 8.5, 300, 2, "Arial", 5)
$AnleitungenGK = GUICtrlCreateIcon("shell32.dll", -127, 502, 19, 26, 26)
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($AnleitungenGK, "Öffnet die Anleitungen", "Click to open", 1, 1)
$OrdnerGK = GUICtrlCreateIcon("shell32.dll", -125, 528, 19, 25, 25)
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($OrdnerGK, "Öffnet den GK Programme Ordner", "Click to open", 1, 1)

GUICtrlCreateGroup("ECT-MZ-TK-Support", 605, 5, 120, 42.5)
GUICtrlSetFont(-1, 8.5, 300, 2, "Arial", 5)
$AnleitungenECTMZ = GUICtrlCreateIcon("shell32.dll", -127, 607, 19, 26, 26)
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($AnleitungenECTMZ, "Öffnet die Anleitungen", "Click to open", 1, 1)
$OrdnerECTMZ_1 = GUICtrlCreateIcon("shell32.dll", -125, 632, 19, 25, 25)
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($OrdnerECTMZ_1, "Öffnet den ECT Programme Ordner", "Click to open", 1, 1)
$OrdnerECTMZ_2 = GUICtrlCreateIcon("shell32.dll", -125, 658, 19, 25, 25)
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($OrdnerECTMZ_2, "Öffnet den MZ Programme Ordner", "Click to open", 1, 1)




$Terminplan = GUICtrlCreateIcon("shell32.dll", -161, 785, 8, 32, 32)
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($Terminplan, "Öffnet den Terminplan", "Click to open", 1, 1)


GUICtrlCreateIcon("shell32.dll", -321, 8, 8, 32, 32)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
GUICtrlCreateLabel("", 0, $iT, $iW, 2, $SS_SUNKEN) ;separator
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKRIGHT + $GUI_DOCKHEIGHT)
GUICtrlCreateLabel("", $iLeftWidth, $iT + 2, 2, $iH - $iT - $iB - 2, $SS_SUNKEN) ;separator
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKBOTTOM + $GUI_DOCKWIDTH)
GUICtrlCreateLabel("", 0, $iH - $iB, $iW, 2, $SS_SUNKEN) ;separator
GUICtrlSetResizing(-1, $GUI_DOCKBOTTOM + $GUI_DOCKLEFT + $GUI_DOCKRIGHT + $GUI_DOCKHEIGHT)
$Footer = GUICtrlCreateLabel("Nachricht:", 10, 366, 60, 17, BitOR($SS_LEFT, $SS_CENTERIMAGE))
$Textnachricht = GUICtrlCreateInput("", 70, 365, 600, 17)
$Senden_Button = GUICtrlCreateButton("senden", 675, 365, 150, 18)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKRIGHT + $GUI_DOCKBOTTOM + $GUI_DOCKHEIGHT)

;add links to the left side
;~ ICON AUFLISTUNG <REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>
$aLink[1] = _AddNewLink("Agenda")
$aLink[2] = _AddNewLink("BOF Tausch Utilities", -167)
$aLink[3] = _AddNewLink("Fremdwährungen", -222)
$aLink[4] = _AddNewLink("Online und Prepaid", -22)
$aLink[5] = _AddNewLink("wichtige Programme", -23)
$aLink[6] = _AddNewLink("wichtige Dokumente", -270)
$aLink[7] = _AddNewLink("", -67)
$aLink[8] = _AddNewLink("Netzlaufwerke LAN", -10)
$aLink[9] = _AddNewLink("Webinterfaces", -243)
$aLink[10] = _AddNewLink("Remote Desktop", -18)
$aLink[11] = _AddNewLink("SQL-Servers", -104)
$aLink[12] = _AddNewLink("MML-Parameter", -201)
$aLink[13] = _AddNewLink("Fiskalisierung", -47)

;and the corresponding GUI's
$aPanel[1] = _AddNewPanel("Bearbeitung in Progress")
$aPanel[2] = _AddNewPanel("Anwendungen für den BOF-Tausch")
$aPanel[3] = _AddNewPanel("Übersicht Fremdwährungsfilialen")
$aPanel[4] = _AddNewPanel("Störmeldung Online-/Prepaidprodukte")
$aPanel[5] = _AddNewPanel("Links zu häufig genutzten Programmen")
$aPanel[6] = _AddNewPanel("wichtige Dokumente")
;~ $aPanel[7] = _AddNewPanel("Under construction")
$aPanel[8] = _AddNewPanel("Netzlaufwerke LAN")
$aPanel[9] = _AddNewPanel("Webinterfaces")
$aPanel[10] = _AddNewPanel("Remote Desktop")
$aPanel[11] = _AddNewPanel("SQL-Servers")
$aPanel[12] = _AddNewPanel("MML-Parameter")
$aPanel[13] = _AddNewPanel("Fiskalisierung")

;add some controls to the panels
_AddControlsToPanel($aPanel[1])
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
$Aufgaben_edit = GUICtrlCreateEdit("", 10, 37, $iW - $iLeftWidth + 2 - 20 - 5, $iH - $iT - $iB - 80, BitOR($ES_AUTOVSCROLL, $ES_NOHIDESEL, $ES_WANTRETURN, $WS_VSCROLL), $WS_EX_STATICEDGE)
GUICtrlSetData($Aufgaben_edit, $Aufgabeninhalt)
;~ FileClose($Aufgabeninhalt)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKRIGHT + $GUI_DOCKBOTTOM + $GUI_DOCKHEIGHT)
$Aktualisierung_stoppen = GUICtrlCreateCheckbox("Verlauf leeren", 10, 270, 80, 25)
$speichern = GUICtrlCreateIcon("shell32.dll", -7, 100, 265, 25, 25)
GUICtrlSetCursor(-1, 0)
GUICtrlSetState($speichern, $GUI_DISABLE)
$Aktualisierung_einlesen = GUICtrlCreateLabel("Nächste Überprüfung in 3 Sekunden", 490, 275, 200, 25)
GUICtrlSetCursor(-1, 0)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKRIGHT + $GUI_DOCKBOTTOM + $GUI_DOCKHEIGHT)
GUICtrlSetState($Aktualisierung_einlesen, $GUI_DISABLE)

_AddControlsToPanel($aPanel[2])
GUICtrlCreateLabel("Automatisierter E-Mail Versand Abschlussmeldung:", 8, 250, 250, 18)
GUICtrlCreateLabel("Filialnr.", 8, 275, 36, 17)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
Local $Eingabe_Filialnummer = GUICtrlCreateInput("", 56, 270, 45, 21)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
Local $Button_ausfuehren = GUICtrlCreateButton("Senden", 115, 268, 75, 25)
GUICtrlSetTip($Button_ausfuehren, "Versendet eine Mail an 00Filialtechnik", "E-Mail", 2, 1)
$Prog15 = GUICtrlCreateLabel("- Artikelstamm prüfen", 10, 150, 150, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
$Prog3 = GUICtrlCreateLabel("- Mitarbeiter auslesen", 10, 170, 150, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
$Prog4 = GUICtrlCreateLabel("- WG Bestände", 10, 190, 150, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
$Prog5 = GUICtrlCreateLabel("- Nachsendungen", 10, 210, 150, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
$Prog9 = GUICtrlCreateLabel("-> BOF-Tausch Quick Start", 180, 180, 150, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
$Label1 = GUICtrlCreateLabel("Wegsichern der Kassen Backups:", 8, 40, 165, 17)
$input_filnrbackup = GUICtrlCreateInput("", 51, 62, 121, 21)
Local $Button_Backup = GUICtrlCreateButton("wegsichern", 180, 61, 70, 24)
GUICtrlSetTip($Button_Backup, "Sichert das Backup an den Kassen weg - _old", "Backups", 2, 1)
$Label2 = GUICtrlCreateLabel("Filialnr.", 8, 66, 40, 17)
Global $gesamt[0][2], $trim, $ip
DirCreate(@ScriptDir & "<REDACTED>")

_AddControlsToPanel($aPanel[3])
GUICtrlCreateLabel("Schweizer Franken", 10, 40, 120, 25, -1, 0)
$Schweizer_Franken = GUICtrlCreateList("", 10, 60, 90, 150, $LBS_SORT, 0)
GUICtrlSetData(-1, "3007|3078|4242|5063|5261|5394|5475|5482|5556|7888|7986")
_GUICtrlListBox_Sort($Schweizer_Franken)
GUICtrlCreateLabel("Dänische Kronen", 140, 40, 120, 25, -1, 0)
$Daenische_Kronen = GUICtrlCreateList("", 140, 60, 90, 150, $LBS_SORT, 0)
GUICtrlSetData(-1, "2075|2096|2120|2200|5017|5764|7083|7116|7138")
_GUICtrlListBox_Sort($Daenische_Kronen)
GUICtrlCreateLabel("Euro in CHF Kurs:", 270, 40, 120, 25, -1, 0)
Local $Button_EuroinCHF = GUICtrlCreateButton("CHF", 270, 60, 90, 24)
GUICtrlSetTip($Button_EuroinCHF, "Hohlt den CHF Kurs über API von https://open.er-api.com", "Euro in CHF Kurs", 2, 1)
GUICtrlCreateLabel("Euro in DKK Kurs:", 270, 100, 120, 25, -1, 0)
Local $Button_EuroinDKK = GUICtrlCreateButton("DKK", 270, 120, 90, 24)
GUICtrlSetTip($Button_EuroinDKK, "Hohlt den DKK Kurs über API von https://open.er-api.com", "Euro in DKK Kurs", 2, 1)
GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)

_AddControlsToPanel($aPanel[4])
$Group1 = GUICtrlCreateGroup("Anbieter:", 10, 28, 430, 45)
$Combo1 = GUICtrlCreateCombo("", 14, 40, 420, 30, BitOR($CBS_DROPDOWN, $WS_VSCROLL))
GUICtrlSetFont(-1, 10, 400, 0, "@Arial Unicode MS")
GUICtrlSetData(-1, "M&M (support@mm-worldnet.de)|ePay (cashmanagement@epay.de)|Blackhawk (retail@bhawk.de)")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group2 = GUICtrlCreateGroup("Filiale:", 10, 68, 143, 45)
$input_filnr = GUICtrlCreateInput("", 14, 80, 133, 25, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group3 = GUICtrlCreateGroup("Kasse:", 153, 68, 144, 45)
$input_kasse = GUICtrlCreateInput("", 156, 80, 134, 25, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group4 = GUICtrlCreateGroup("Datum/Uhrzeit", 297, 68, 143, 45)
$input_datumuhrzeit = GUICtrlCreateInput("", 301, 80, 133, 25, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group5 = GUICtrlCreateGroup("EAN-Code:", 10, 108, 205, 49)
$Combo2 = GUICtrlCreateCombo("", 14, 120, 195, 25, BitOR($CBS_DROPDOWN, $WS_VSCROLL))
GUICtrlSetFont(-1, 10, 400, 0, "@Arial Unicode MS")
GUICtrlSetData(-1, "4260433459028|4260354153159|4260354153166|5051644040520|5051644038817|5051644009589|5051644009596|5051644047246|5051644023912|4049206012321|5051644038077|5051644035892|5051644035908|4041578145881|5051644038886|4049206012376|5051644015023|5051644017607|5051644038879|4260402095431|4260402095448|4049206029824|4049206029824|5051644048663|4041578126514|4041578126521|4251404503659|4260354151889|4260513897238|4260354151896|4260513897245|4260354151902|4260513897252|4251604152282|4049206027851|4049206027875|4049206012512|4049206012536|5051644011148|5450537005798|5450537005767|5051644011117|5051644011124|5450537005774|5051644011131|5450537005781|4049206015735|4260433459035|4049206012284|5051644037070|5051644022472|5051644022465|5051644022489|4049206013175|5051644007752|5051644007776|5051644045433|5051644045426|4260354151797|4260354151803|5051644002313|5051644017676|5051644009602|5051644017232|4250135800068|4250135800099|4250135800044|4250135800082|4251404512989|4049206012499|4251404530303|4251404530310|5051644043590|5051644052523|4260414673788|5051644052516|4251404565497|5051644052509|4251404565503|4260433453118|4260445223105|4049206017227|4049206017548|4049206012352|4049206012727|5051644030637|4260445221798|4260445221774|5051644007745|4049206012307|5051644040155|")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group8 = GUICtrlCreateGroup("Seriennummer:", 218, 108, 222, 49)
$input_seriennr = GUICtrlCreateInput("", 223, 120, 210, 25, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group6 = GUICtrlCreateGroup("betroffenes Produkt:", 10, 148, 430, 49)
$Combo3 = GUICtrlCreateCombo("", 14, 160, 420, 25, BitOR($CBS_DROPDOWN, $WS_VSCROLL))
GUICtrlSetFont(-1, 10, 400, 0, "@Arial Unicode MS")
GUICtrlSetData(-1, "Amazon 100Euro|Amazon 25 Euro|Amazon 50 Euro|Amazon Multipack 30 Euro|Amazon.de 100 Euro|Amazon.de 25 Euro|Amazon.de 50 Euro|Blizzard 20 Euro ST|Booking.com 50Euro|C&A 25 Euro|Decathlon 25EUR|Dein Gutschein 25EUR|Dein Gutschein 50EUR|Deutsche Bahn GS Karte|Douglas 15Euro|Douglas 25 Euro|EA 25Euro|EA EAOP 15 Euro|Ernstings 20Euro|FB Generic 15 Euro|FB Generic 25Euro|Flixbus 20 Euro|Flixbus EU Ticket|Gamestop 25 Euro|Geschenkkarte Ikea 25 Eur|Geschenkkarte Ikea 40 Eur|Google Play 100 Euro|Google Play 15 Euro|Google Play 15 Euro|Google Play 25 Euro|Google Play 25 Euro|Google Play 50 Euro|Google Play 50 Euro|Google Play 5Euro ST|H&M 15Euro|H&M 25Euro|IKEA 25 Euro|IKEA 40 Euro|iTunes 100 Euro|iTunes 100 Euro Wave|iTunes 15 Euro Wave|i-Tunes 15Euro splash ST|i-Tunes 25 Euro splash ST|iTunes 25 Euro Wave|i-Tunes 50 Euro splash|iTunes 50 Euro Wave|JOMC 6,99Euro|Kindle 25Euro|Kino Gutschein 25 Euro|LOL 20Euro|Mastercard Aufladung 100|Mastercard Aufladung 25 E|Mastercard Aufladung 51 E|Media Markt 25Euro|Microsoft Xbox Live 15 Eu|Microsoft Xbox Live 25Eur|Netflix 15 Euro|Netflix 25 Euro|Nintendo 15 Euro|Nintendo 25 Euro|Nintendo eShop Card 15 Eu|Nintendo eShop Card 25 Eu|Nintendo Switch 19,99 ST|Nintendo Switch 7,99EUR|Paysafecard 10 EURO|Paysafecard 100 EURO|Paysafecard 25 EURO|Paysafecard 50 EURO|PS+ 24,99 Euro|Saturn 25 Euro|Sony 20Euro|Sony 50Euro|Sony PSN 10 Euro ST|Spotify 10 Euro|Spotify 10Euro|Spotify 30 Euro|Spotify 30Euro|Spotify 60 Euro|Spotify 60Euro|Steam 20Euro|Steam 50 Euro|Takko 15 Euro|Tchibo 15 Euro|Thalia 20 Euro|Thalia 25 Euro|TK Maxx 25 Euro|XBOX 15 Euro|XBOX 25 Euro|XBOX Game Pass 9,99EUR|Zalando 25 Euro|Zalando 50 Euro|")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group7 = GUICtrlCreateGroup("Störfallbeschreibung:", 10, 188, 430, 65)
$beschreibung = GUICtrlCreateInput("", 14, 204, 420, 45)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Button_Absenden = GUICtrlCreateButton("Absenden", 10, 253, 430, 41)
GUICtrlSetTip($Button_Absenden, "Sendet eine E-Mail an den ausgewählten Anbieter!", "Störmeldung", 2, 1)

_AddControlsToPanel($aPanel[5])
$Prog1 = GUICtrlCreateLabel("- DC Promotionkontrolle", 10, 30, 150, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
$Prog2 = GUICtrlCreateLabel("- DC Punktefreitag", 10, 50, 150, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
$Prog7 = GUICtrlCreateLabel("- Kontrolle Promotionversand", 180, 30, 150, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
$Prog12 = GUICtrlCreateLabel("- Promotionsuche", 180, 50, 150, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
$Prog16 = GUICtrlCreateLabel("- Prüfziffer", 180, 70, 150, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
$Prog8 = GUICtrlCreateLabel("- Kontrolle Exportsabgleich", 10, 210, 150, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
$Prog11 = GUICtrlCreateLabel("- Exportdaten Prüfen", 180, 210, 150, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
$Prog6 = GUICtrlCreateLabel("- VP-Anlage", 10, 250, 150, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
$Prog10 = GUICtrlCreateLabel("- Unverarbeitete Belege", 10, 270, 150, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
$Prog13 = GUICtrlCreateLabel("- Gutscheinkontrolle", 180, 250, 150, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
$Prog14 = GUICtrlCreateLabel("- Handykarten DB BOF Prüfung", 180, 270, 150, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
$Prog17 = GUICtrlCreateLabel("- XML Duplikator", 10, 70, 150, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKRIGHT + $GUI_DOCKBOTTOM + $GUI_DOCKHEIGHT)

_AddControlsToPanel($aPanel[6])
$wichtige_Dokumente_01 = GUICtrlCreateLabel("- CoC Ranking ((öffnet beim anklicken!))", 10, 30, 300, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($wichtige_Dokumente_01, "\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>","CoC Sequence und Resolution Übersicht", 2, 1)
$wichtige_Dokumente_02 = GUICtrlCreateLabel("- NEÖ_Aktuell_original Liste ((öffnet beim anklicken!))", 10, 55, 300, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($wichtige_Dokumente_02, "\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>","NEÖ_Aktuell_original Liste", 2, 1)
$wichtige_Dokumente_03 = GUICtrlCreateLabel("- GK-Support Unterstützung ((öffnet beim anklicken!))", 10, 80, 300, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($wichtige_Dokumente_03, "\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>","GK-Support Unterstützung", 2, 1)


_AddControlsToPanel($aPanel[8])
$Netzlaufwerk_LAN_01 = GUICtrlCreateLabel("- Gutschein Import Verzeichnis ((öffnet beim anklicken!))", 10, 30, 300, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($Netzlaufwerk_LAN_01, "\<REDACTED><REDACTED>", "Gutschein Import Laufwerk", 2, 1)
$Netzlaufwerk_LAN_02 = GUICtrlCreateLabel("- Verzeichnis für Importierte / gelieferte Filialdaten ((öffnet beim anklicken!))", 10, 55, 350, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($Netzlaufwerk_LAN_02, "\<REDACTED><REDACTED>", "Abverkaufsdaten Laufwerk", 2, 1)
$Netzlaufwerk_LAN_03 = GUICtrlCreateLabel("- Verzeichnis Versandaten WaWi ((öffnet beim anklicken!))", 10, 80, 350, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($Netzlaufwerk_LAN_03, "\<REDACTED><REDACTED><REDACTED><REDACTED>", "ACSIIK Laufwerk", 2, 1)
$Netzlaufwerk_LAN_04 = GUICtrlCreateLabel("- Verzeichnis Import TA Daten ((öffnet beim anklicken!))", 10, 105, 350, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($Netzlaufwerk_LAN_04, "\<REDACTED><REDACTED><REDACTED><REDACTED>", "'Ein' Laufwerk", 2, 1)
$Netzlaufwerk_LAN_05 = GUICtrlCreateLabel("- Verzeichnis Prisma Versand Daten ((öffnet beim anklicken!))", 10, 130, 350, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($Netzlaufwerk_LAN_05, "\<REDACTED><REDACTED>", "Prisma Import Laufwerk", 2, 1)

_AddControlsToPanel($aPanel[9])
$Webinterface_01 = GUICtrlCreateLabel("- Gutschein Server User Interface ((öffnet beim anklicken!))", 10, 30, 300, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($Webinterface_01, "http://<REDACTED>:8080/app-svs/gkr-svs - UN & PW: individuell", "Gutschein Server UI", 2, 1)
$Webinterface_02 = GUICtrlCreateLabel("- Central Promotion Designer ((öffnet beim anklicken!))", 10, 55, 300, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($Webinterface_02, "http://<REDACTED>:8080/app-cpd/gkr-cpd - UN & PW: individuell", "Central Promotion Designer", 2, 1)
$Webinterface_03 = GUICtrlCreateLabel("- WebAdmin Router Interface ((öffnet beim anklicken!))", 10, 80, 300, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($Webinterface_03, "https://n01webadmp-01v/Account/Login?ReturnUrl=%2f - UN & PW: individuell", "WebAdmin UI", 2, 1)
$Webinterface_04 = GUICtrlCreateLabel("- Wechselkurse von fxtop ((öffnet beim anklicken!))", 10, 105, 300, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($Webinterface_04, "https://fxtop.com/de/vergangene-rechner.php?A=100&C1=CHF&C2=EUR&DD=07&MM=10&YYYY=2020&B=1&P=&I=1&btnOK=Gehen", "Wechselkursrecher", 2, 1)
$Webinterface_05 = GUICtrlCreateLabel("- Auswertungen Filialtechnik ((öffnet beim anklicken!))", 10, 130, 300, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($Webinterface_05, "http://webfilp.netto.lan/auswertung/index.php?auswertung=auswertung_<REDACTED>groesse_der_datenbanken", "Auswertungen Filialtechnik", 2, 1)
$Webinterface_06 = GUICtrlCreateLabel("- CRM Cockpit ((öffnet beim anklicken!))", 10, 155, 320, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($Webinterface_06, "https://crmcockpit.netto.lan/startseite", "CRM Cockpit", 2, 1)
$Webinterface_07 = GUICtrlCreateLabel("- Haushaltsübliche Mengen Report ((öffnet beim anklicken!))", 10, 180, 320, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($Webinterface_07, "https://sqlrsp/ReportS/powerbi/Oeffentlich/Filialtechnik/HaushaltsueblicheMengen/HaushaltsueblicheMengen", "HH-Mengen Report", 2, 1)
$Webinterface_08 = GUICtrlCreateLabel("- POS-Dashboard ((öffnet beim anklicken!))", 10, 205, 320, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($Webinterface_08, "http://n01gksupp-01v:8088/", "POS-Dashboard", 2, 1)
$Webinterface_09 = GUICtrlCreateLabel("- Telekom Business Login ((öffnet beim anklicken!))", 10, 230, 250, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($Webinterface_09, "https://business-login.telekom.de/auth/realms/tsystems-customer-k2/protocol/openid-connect/auth?scope=openid&state=5VTgGeVE2MM7WMrwRUvKheDrZ0w_P8KpBgcTrp_-ey8.NCjEouLpnfY.F4dhaRmpQQyJplcc7lGC2g&response_type=code&client_id=prod-telekom-customer-k2&redirect_uri=https%3A%2F%2Fbusiness-login.telekom.de%2Fauth%2Frealms%2Ftelekom-customer-k2%2Fbroker%2Fprod-tsi-customer-k2%2Fendpoint&nonce=gblQJ1hEJYriMZpxMY04aQ", "Telekom", 2, 1)
$Webinterface_10 = GUICtrlCreateLabel("- Recherche EC-Karten ((öffnet beim anklicken!))", 10, 255, 250, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($Webinterface_10, "http://sqlrsp.netto.lan/reports/report/Oeffentlich/Filialtechnik/EcKartenDaten/Ec_Kartendaten", "Recherche EC-Karten", 2, 1)
$Webinterface_11 = GUICtrlCreateLabel("- Recherche Kreditkarten ((öffnet beim anklicken!))", 400, 255, 250, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($Webinterface_11, "http://sqlrsp.netto.lan/reports/report/Oeffentlich/Filialtechnik/Kreditkartendaten/Recherche_Kreditkartendaten", "Recherche Kreditkarten", 2, 1)
$Webinterface_12 = GUICtrlCreateLabel("- Payone Kundenportal ((öffnet beim anklicken!))", 400, 230, 250, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($Webinterface_12, "https://www.serviceportal.mc.ingenico.com/auth/realms/ips-pcs/protocol/openid-connect/auth?client_id=portal&redirect_uri=https%3A%2F%2Fwww.serviceportal.mc.ingenico.com%2F%23%2F&state=d15c60a0-3c0f-4973-896a-e86ed7b22d67&response_mode=fragment&response_type=code&scope=openid&nonce=00c1b8cb-d824-4e2d-8a3f-9b3db47329b7", "Payone Kundenportal", 2, 1)

_AddControlsToPanel($aPanel[10])
$RemoteDesktop_01 = GUICtrlCreateLabel("- n01storep-02v >>> <REDACTED> Neu! ((öffnet beim anklicken!))", 10, 30, 325, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($RemoteDesktop_01, "n01storep-02v - UN & PW: <REDACTED>", "<REDACTED> Server Neu", 2, 1)

$RemoteDesktop_02 = GUICtrlCreateLabel("- N01GKSRV-03V >>> Refund Server! ((öffnet beim anklicken!))", 10, 55, 325, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($RemoteDesktop_02, "N01GKSRV-03V - UN & PW: <REDACTED>", "Refund Server", 2, 1)

$RemoteDesktop_03 = GUICtrlCreateLabel("- N01StoreT-03V >>> Neuer Test - SM! ((öffnet beim anklicken!))", 10, 80, 325, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($RemoteDesktop_03, "N01StoreT-03V- UN & PW: <REDACTED>", "Neuer Test - <REDACTED>", 2, 1)

$RemoteDesktop_05 = GUICtrlCreateLabel("- n01gksrv-05v >>> Gutschein-Server! ((öffnet beim anklicken!))", 10, 105, 325, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($RemoteDesktop_05, "<REDACTED> - UN & PW: <REDACTED>", "Gutschein-Server VM", 2, 1)

$RemoteDesktop_06 = GUICtrlCreateLabel("- n01GKsupp-01v >>> GK-Support VM! ((öffnet beim anklicken!))", 10, 130, 325, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($RemoteDesktop_06, "n01GKsupp-01v - UN & PW: <REDACTED>", "GK-Support VM", 2, 1)

$RemoteDesktop_04 = GUICtrlCreateLabel("- N01TSPrisma-01V >>> Prisma Versand VM! ((öffnet beim anklicken!))", 10, 155, 325, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($RemoteDesktop_04, "n01GKsupp-01v - UN & PW: Windows Login", "Prisma Versand VM", 2, 1)

$RemoteDesktop_07 = GUICtrlCreateLabel("- N01TSFilRDP-02V.netto.lan >>> Filial VM! ((öffnet beim anklicken!))", 10, 180, 325, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($RemoteDesktop_07, "N01TSFilRDP-02V.netto.lan - UN & PW: Persönlich", "Store Remote VM", 2, 1)

_AddControlsToPanel($aPanel[11])
$Label_SQLDBuNLW = GUICtrlCreateLabel("SQL Datenbanken:", 10, 30, 285, 17)
GUICtrlSetFont(-1, 8.5, 700, 0, "@Arial Unicode MS")

$SQL_Datenbanken = GUICtrlCreateLabel("SQL Datenbanken:", 10, 50, 70, 30)
$SQL_Datenbanken_TESTGS = GUICtrlCreateLabel("Testgutschein-Server mit Windows-Authentifizierung:", 10, 50, 285, 30)
$sqlt<REDACTED><REDACTED> = GUICtrlCreateLabel("sqltgk,<REDACTED>", 10, 70, 285, 50)
$iCopy_003 = GUICtrlCreateButton("Strg+C", 290, 50, 50, 33)

$SQL_Datenbanken_GS = GUICtrlCreateLabel("Gutschein-Server:", 10, 90, 285, 30)
$SQLP<REDACTED>SQLP<REDACTED><REDACTED>_1 = GUICtrlCreateLabel("SQLPGK<REDACTED>", 10, 110, 285, 50)
$iCopy_004 = GUICtrlCreateButton("Strg+C", 290, 90, 50, 33)
$GS_UN = GUICtrlCreateLabel("UN:", 340, 90, 20, 17, BitOR($SS_LEFT, $SS_CENTERIMAGE))
$iCopy_005 = GUICtrlCreateButton("<REDACTED>", 365, 90, 80, 17)
$GS_PW = GUICtrlCreateLabel("PW", 340, 107, 20, 17, BitOR($SS_LEFT, $SS_CENTERIMAGE))
$iCopy_006 = GUICtrlCreateButton("<REDACTED>", 365, 107, 80, 17)

$SM_Datenbank = GUICtrlCreateLabel("Neuer SM-SQL Datenbank:", 10, 130, 285, 30)
$SQLP<REDACTED>SQLP<REDACTED><REDACTED>_2 = GUICtrlCreateLabel("SQLP<REDACTED>,<REDACTED>", 10, 150, 285, 50)
$iCopy_007 = GUICtrlCreateButton("Strg+C", 290, 130, 50, 33)
$SM_DB_UN = GUICtrlCreateLabel("UN:", 340, 130, 20, 17, BitOR($SS_LEFT, $SS_CENTERIMAGE))
$iCopy_008 = GUICtrlCreateButton("<REDACTED>", 365, 130, 80, 17)
$SM_DB_PW = GUICtrlCreateLabel("PW", 340, 144, 20, 17, BitOR($SS_LEFT, $SS_CENTERIMAGE))
$iCopy_009 = GUICtrlCreateButton("<REDACTED>", 365, 147, 80, 17)

$SQL_DB_POS = GUICtrlCreateLabel("POS-Umsatzdaten-Server mit Windows-Authentifizierung:", 10, 170, 285, 30)
$<REDACTED>_<REDACTED> = GUICtrlCreateLabel("<REDACTED>,<REDACTED>", 10, 190, 285, 50)
$iCopy_010 = GUICtrlCreateButton("Strg+C", 290, 170, 50, 33)

$SQL_DB_REFUND = GUICtrlCreateLabel("Refund-Server mit Windows-Authentifizierung:", 10, 210, 285, 30)
$SQLPLeergut_<REDACTED> = GUICtrlCreateLabel("SQLPLeergut,<REDACTED>", 10, 230, 285, 50)
$iCopy_011 = GUICtrlCreateButton("Strg+C", 290, 210, 50, 33)



_AddControlsToPanel($aPanel[12])
$Label_<REDACTED> = GUICtrlCreateLabel("<REDACTED>:", 10, 30, 285, 17)
GUICtrlSetFont(-1, 8.5, 700, 0, "@Arial Unicode MS")
$Parameter = GUICtrlCreateLabel("Parameter:", 10, 50, 70, 30)
$iEdit_002 = GUICtrlCreateLabel("http://10.{3}.{4}.10:8180/mml-branch/event/call/{0}/{1}", 10, 70, 285, 50)
$iCopy_002 = GUICtrlCreateButton("Strg+C", 290, 50, 50, 33)

_AddControlsToPanel($aPanel[13])
$Label_Shell_02 = GUICtrlCreateLabel("Internetadressen:", 10, 30, 285, 17)
GUICtrlSetFont(-1, 8.5, 700, 0, "@Arial Unicode MS")
$Fiskal_Interface_01 = GUICtrlCreateLabel("- Fiskal Cloud Portal ((öffnet beim anklicken!))", 10, 40, 300, 20, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($Fiskal_Interface_01, "https://fiskal.cloud/api/management-ui/dashboard/statistics", "User Interface Deutsche Fiskal", 2, 1)
$Label_Shell_03 = GUICtrlCreateLabel("Auswertung - Prüfung DNS IPv4:", 10, 70, 285, 17)
GUICtrlSetFont(-1, 8.5, 700, 0, "@Arial Unicode MS")
$Fiskal_Interface_02 = GUICtrlCreateLabel("- DNS Server 10.xx.xx.1 -> Suche Filiale ((öffnet beim anklicken!))", 10, 85, 330, 20, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($Fiskal_Interface_02, "http://webfilp.netto.lan/auswertung/index.php?auswertung=auswertung_filiale_ip_adressen&device=bof", "IP-Adressen - Gerät: BOF", 2, 1)
$Label_Shell_04 = GUICtrlCreateLabel("Auswertung - Fiskal Cloud Erreichbarkeit:", 10, 110, 285, 17)
GUICtrlSetFont(-1, 8.5, 700, 0, "@Arial Unicode MS")
$Fiskal_Interface_03 = GUICtrlCreateLabel("- Cloud Erreichbarkeit per Curl.exe -> Suche Filiale ((öffnet beim anklicken!))", 10, 125, 360, 20, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($Fiskal_Interface_03, "http://webfilp.netto.lan/auswertung/index.php?auswertung=auswertung_buero_bof_status_fiskal_cloud_erreichbarkeit", "Fiskal Cloud Erreichbarkeit", 2, 1)
$Label_Shell_002 = GUICtrlCreateLabel("<REDACTED>-Import-Fiskal_NEUER-SM:", 10, 150, 285, 17)
GUICtrlSetFont(-1, 8.5, 700, 0, "@Arial Unicode MS")
$Fiskal_NEUERSM = GUICtrlCreateLabel("- Verzeichnis Import Fiskal File ((öffnet beim anklicken!))", 10, 165, 350, 25, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlSetCursor(-1, 0)
GUICtrlSetTip($Fiskal_NEUERSM, " \<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>", "'SM Server Import' Laufwerk", 2, 1)
$Label_Shell_01 = GUICtrlCreateLabel("Auszuführende Befehle in der PowerShell am BOF:", 10, 237, 285, 17)
GUICtrlSetFont(-1, 8.5, 700, 0, "@Arial Unicode MS")
$iW10 = GUICtrlCreateLabel("Windows 10:", 10, 255, 70, 30)
$iEdit_001 = GUICtrlCreateLabel("test-netconnection -computername fiskal.cloud -port 443", 10, 275, 275, 20)
$iCopy_001 = GUICtrlCreateButton("Strg+C", 290, 255, 50, 33)

;set default to Panel1
GUISwitch($aPanel[1])
;show the main GUI
GUISetState(@SW_SHOW, $hMainGUI)
#EndRegion definition der Userform

#Region UserForm Nachricht
$Nachricht = GUICreate("Private Message", 450, 150, @DesktopWidth - 460, @DesktopHeight - 250)
GUISetIcon("shell32.dll", -112, $Nachricht)
$Editor_private = GUICtrlCreateEdit("", 25, 30, 400, 80, BitOR($ES_AUTOVSCROLL, $ES_NOHIDESEL, $ES_WANTRETURN, $WS_VSCROLL), $WS_EX_STATICEDGE)
$Chatpartner = GUICtrlCreateLabel("", 25, 8, 50, 17, BitOR($SS_LEFT, $SS_CENTERIMAGE))
GUICtrlCreateLabel("Nachricht:", 10, 120, 50, 17, BitOR($SS_LEFT, $SS_CENTERIMAGE))
$Textnachricht_private = GUICtrlCreateInput("", 65, 120, 300, 16)
$Senden_Button_private = GUICtrlCreateButton("senden", 380, 120, 60, 17)
#EndRegion UserForm Nachricht

GUISetOnEvent($GUI_EVENT_CLOSE, '_CloseGUI1', $hMainGUI)
GUISetOnEvent($GUI_EVENT_CLOSE, '_CloseGUI2', $Nachricht)
GUICtrlSetOnEvent($Prog1, 'Prog1_ausfuehren')
GUICtrlSetOnEvent($Prog2, 'Prog2_ausfuehren')
GUICtrlSetOnEvent($Prog3, 'Prog3_ausfuehren')
GUICtrlSetOnEvent($Prog4, 'Prog4_ausfuehren')
GUICtrlSetOnEvent($Prog5, 'Prog5_ausfuehren')
GUICtrlSetOnEvent($Prog6, 'Prog6_ausfuehren')
GUICtrlSetOnEvent($Prog7, 'Prog7_ausfuehren')
GUICtrlSetOnEvent($Prog8, 'Prog8_ausfuehren')
GUICtrlSetOnEvent($Prog9, 'Prog9_ausfuehren')
GUICtrlSetOnEvent($Prog10, 'Prog10_ausfuehren')
GUICtrlSetOnEvent($Prog11, 'Prog11_ausfuehren')
GUICtrlSetOnEvent($Prog12, 'Prog12_ausfuehren')
GUICtrlSetOnEvent($Prog13, 'Prog13_ausfuehren')
GUICtrlSetOnEvent($Prog14, 'Prog14_ausfuehren')
GUICtrlSetOnEvent($Prog15, 'Prog15_ausfuehren')
GUICtrlSetOnEvent($Prog16, 'Prog16_ausfuehren')
GUICtrlSetOnEvent($Prog17, 'Prog17_ausfuehren')
GUICtrlSetOnEvent($OrdnerGK, 'Ordner<REDACTED>ausfuehren')
GUICtrlSetOnEvent($OrdnerECTMZ_1, 'OrdnerECTMZ_1_ausfuehren')
GUICtrlSetOnEvent($OrdnerECTMZ_2, 'OrdnerECTMZ_2_ausfuehren')
GUICtrlSetOnEvent($Terminplan, 'Terminplan_oeffnen')
GUICtrlSetOnEvent($AnleitungenGK, 'Anleitungen_oeffnen_GK')
GUICtrlSetOnEvent($AnleitungenECTMZ, 'Anleitungen_oeffnen_ECTMZ_ausfuehren')
GUICtrlSetOnEvent($speichern, 'speichern')
GUICtrlSetOnEvent($Button_ausfuehren, 'ausfuehren')
GUICtrlSetOnEvent($Button_Backup, 'backup')
GUICtrlSetOnEvent($Button_Absenden, 'absenden')
GUICtrlSetOnEvent($Button_EuroinCHF, 'WechselkursCHF')
GUICtrlSetOnEvent($Button_EuroinDKK, 'WechselkursDKK')
GUICtrlSetOnEvent($aLink[1], 'Link1')
GUICtrlSetOnEvent($aLink[2], 'Link2')
GUICtrlSetOnEvent($aLink[3], 'Link3')
GUICtrlSetOnEvent($aLink[4], 'Link4')
GUICtrlSetOnEvent($aLink[5], 'Link5')
GUICtrlSetOnEvent($aLink[6], 'Link6')
GUICtrlSetOnEvent($wichtige_Dokumente_01, 'wichtige_Dokumente_01_ausfuehren')
GUICtrlSetOnEvent($wichtige_Dokumente_02, 'wichtige_Dokumente_02_ausfuehren')
GUICtrlSetOnEvent($wichtige_Dokumente_03, 'wichtige_Dokumente_03_ausfuehren')
;~ GUICtrlSetOnEvent($aLink[7], 'Link7')
GUICtrlSetOnEvent($aLink[8], 'Link8')
GUICtrlSetOnEvent($Netzlaufwerk_LAN_01, 'Netzlaufwerk_LAN_01_ausfuehren')
GUICtrlSetOnEvent($Netzlaufwerk_LAN_02, 'Netzlaufwerk_LAN_02_ausfuehren')
GUICtrlSetOnEvent($Netzlaufwerk_LAN_03, 'Netzlaufwerk_LAN_03_ausfuehren')
GUICtrlSetOnEvent($Netzlaufwerk_LAN_04, 'Netzlaufwerk_LAN_04_ausfuehren')
GUICtrlSetOnEvent($Netzlaufwerk_LAN_05, 'Netzlaufwerk_LAN_05_ausfuehren')
GUICtrlSetOnEvent($aLink[9], 'Link9')
GUICtrlSetOnEvent($Webinterface_01, 'Webinterface_01_ausfuehren')
GUICtrlSetOnEvent($Webinterface_02, 'Webinterface_02_ausfuehren')
GUICtrlSetOnEvent($Webinterface_03, 'Webinterface_03_ausfuehren')
GUICtrlSetOnEvent($Webinterface_04, 'Webinterface_04_ausfuehren')
GUICtrlSetOnEvent($Webinterface_05, 'Webinterface_05_ausfuehren')
GUICtrlSetOnEvent($Webinterface_06, 'Webinterface_06_ausfuehren')
GUICtrlSetOnEvent($Webinterface_07, 'Webinterface_07_ausfuehren')
GUICtrlSetOnEvent($Webinterface_08, 'Webinterface_08_ausfuehren')
GUICtrlSetOnEvent($Webinterface_09, 'Webinterface_09_ausfuehren')
GUICtrlSetOnEvent($Webinterface_10, 'Webinterface_10_ausfuehren')
GUICtrlSetOnEvent($Webinterface_11, 'Webinterface_11_ausfuehren')
GUICtrlSetOnEvent($Webinterface_12, 'Webinterface_12_ausfuehren')
GUICtrlSetOnEvent($aLink[10], 'Link10')
GUICtrlSetOnEvent($RemoteDesktop_01, 'RemoteDesktop_01_ausfuehren')
GUICtrlSetOnEvent($RemoteDesktop_02, 'RemoteDesktop_02_ausfuehren')
GUICtrlSetOnEvent($RemoteDesktop_03, 'RemoteDesktop_03_ausfuehren')
GUICtrlSetOnEvent($RemoteDesktop_04, 'RemoteDesktop_04_ausfuehren')
GUICtrlSetOnEvent($RemoteDesktop_05, 'RemoteDesktop_05_ausfuehren')
GUICtrlSetOnEvent($RemoteDesktop_06, 'RemoteDesktop_06_ausfuehren')
GUICtrlSetOnEvent($RemoteDesktop_07, 'RemoteDesktop_07_ausfuehren')
GUICtrlSetOnEvent($aLink[11], 'Link11')
GUICtrlSetOnEvent($iCopy_003, 'iCopy_003')
GUICtrlSetOnEvent($iCopy_004, 'iCopy_004')
GUICtrlSetOnEvent($iCopy_005, 'iCopy_005')
GUICtrlSetOnEvent($iCopy_006, 'iCopy_006')
GUICtrlSetOnEvent($iCopy_007, 'iCopy_007')
GUICtrlSetOnEvent($iCopy_008, 'iCopy_008')
GUICtrlSetOnEvent($iCopy_009, 'iCopy_009')
GUICtrlSetOnEvent($iCopy_010, 'iCopy_010')
GUICtrlSetOnEvent($iCopy_011, 'iCopy_011')
;~ GUICtrlSetOnEvent($iCopy_012, 'iCopy_012')
;~ GUICtrlSetOnEvent($iCopy_013, 'iCopy_013')
;~ GUICtrlSetOnEvent($iCopy_014, 'iCopy_014')
GUICtrlSetOnEvent($aLink[12], 'Link12')
GUICtrlSetOnEvent($iCopy_002, 'iCopy_002')
GUICtrlSetOnEvent($aLink[13], 'Link13')
GUICtrlSetOnEvent($iCopy_001, 'iCopy_001')
GUICtrlSetOnEvent($Fiskal_Interface_01, 'Fiskal_Interface_01')
GUICtrlSetOnEvent($Fiskal_Interface_02, 'Fiskal_Interface_02')
GUICtrlSetOnEvent($Fiskal_Interface_03, 'Fiskal_Interface_03')
GUICtrlSetOnEvent($Fiskal_NEUERSM, 'Fiskal_NEUERSM')
GUICtrlSetOnEvent($Senden_Button, 'senden')
GUICtrlSetOnEvent($Christian, 'private_Message_Christian')
GUICtrlSetOnEvent($Daniel, 'private_Message_Daniel')
GUICtrlSetOnEvent($Sabrina, 'private_Message_Sabrina')
GUICtrlSetOnEvent($Herbert, 'private_Message_Herbert')
GUICtrlSetOnEvent($TomF, 'private_Message_TomF')
GUICtrlSetOnEvent($Andreas, 'private_Message_Andreas')
GUICtrlSetOnEvent($Stephan, 'private_Message_Stephan')
GUICtrlSetOnEvent($Julia, 'private_Message_Julia')
GUICtrlSetOnEvent($Maximilian, 'private_Message_Maximilian')
GUICtrlSetOnEvent($Tobias, 'private_Message_Tobias')

Global $lastOnlineDirCheck = 0
Global $onlineuser[1] = [0]
Global $lastOnlineUserString = ""

While 1
    ; Alle 2 Sekunden neuen Online-Check
    If TimerDiff($lastOnlineDirCheck) > 2000 Then
        $lastOnlineDirCheck = TimerInit()

        ; Datei erzeugen (mit FileClose!)
        If ProcessExists("<REDACTED>Support.exe") Then
            Local $fh = FileOpen(@ScriptDir & "<REDACTED>\" & @UserName & ".txt", 2 + 8)
            If $fh <> -1 Then FileClose($fh)
        EndIf

        ; Prüfen, ob sich Online-Liste geändert hat
        Local $newUserList = _FileListToArray(@ScriptDir & "<REDACTED>", "*.txt", 1)
        If Not @error Then
            Local $newString = _ArrayToString($newUserList, ";")
            If $newString <> $lastOnlineUserString Then
                $onlineuser = $newUserList
                $lastOnlineUserString = $newString

                ; Farben neu setzen
                _SetUserColor("<REDACTED>c.txt", $Christian)
                _SetUserColor("freyt.txt", $TomF)
                _SetUserColor("dorfnerh.txt", $Herbert)
                _SetUserColor("dresches.txt", $Sabrina)
                _SetUserColor("bluemld.txt", $Daniel)
                _SetUserColor("gleditza.txt", $Andreas)
                _SetUserColor("heinemanns.txt", $Stephan)
                _SetUserColor("karlj.txt", $Julia)
                _SetUserColor("MeierM.txt", $Maximilian)
                _SetUserColor("RauschT.txt", $Tobias)
            EndIf
        EndIf
    EndIf

    ; Prüfen, ob Update-Knopf gedrückt
    If GUICtrlRead($Aktualisierung_stoppen) = 4 Then
        GUICtrlSetState($speichern, $GUI_DISABLE)
        For $lv = 0 To 2
            Sleep(1000)
            GUICtrlSetData($Aktualisierung_einlesen, "Nächste Überprüfung in " & 3 - $lv & " Sekunden")
        Next

        Local $Letzter_Eintrag = _FileListToArray(@ScriptDir & "<REDACTED>", "*.txt")
        If Not @error Then
            Local $datei = $Letzter_Eintrag[UBound($Letzter_Eintrag) - 1]
            Local $Hashwert_neu = _Crypt_HashData(@ScriptDir & "<REDACTED>\" & $datei, $CALG_MD5)

            If $Hashwert_neu <> $Hashwert_start Then
                GUICtrlSetData($Aufgaben_edit, "")
                GUICtrlSetData($Aufgaben_edit, FileRead(@ScriptDir & "<REDACTED>\" & $datei))
                _GUICtrlEdit_LineScroll($Aufgaben_edit, 0, _GUICtrlEdit_GetLineCount($Aufgaben_edit))
                SplashTextOn("Message", "neue Nachricht vorhanden", 300, 50, @DesktopWidth - 320, @DesktopHeight - 180)
                Sleep(3000)
                SplashOff()
                $Hashwert_start = $Hashwert_neu
            EndIf
        EndIf
;~ 		$privater_Chat = _FileListToArray(@ScriptDir & "<REDACTED>", "*.txt")
;~ 		For $a = 1 To UBound($privater_Chat) - 1
;~ 			$Trennzeichen = StringInStr($privater_Chat[$a], "_")
;~ 			If Stringright($privater_Chat[$a], $Trennzeichen + 4) = "_" & @UserName & ".txt" Then
;~ 				$Empfaenger = Stringright($privater_Chat[$a], $Trennzeichen - 1)
;~ 				msgbox(0,"",$Empfaenger)
;~ 				Switch $Empfaenger
;~ 					case "knepperr"
;~ 						GUICtrlSetData($Chatpartner, "Ronny")
;~ 						GUISetState(@SW_SHOW, $Nachricht)
;~ 					case "miedanec"
;~ 						GUICtrlSetData($Chatpartner, "Christian")
;~ 						GUISetState(@SW_SHOW, $Nachricht)
;~ 					case "freyt"
;~ 						GUICtrlSetData($Chatpartner, "Thomas F.")
;~ 						GUISetState(@SW_SHOW, $Nachricht)
;~ 					case "dorfnerh"
;~ 						GUICtrlSetData($Chatpartner, "Herbert")
;~ 						GUISetState(@SW_SHOW, $Nachricht)
;~ 					case "dresches"
;~ 						GUICtrlSetData($Chatpartner, "Sabrina")
;~ 						GUISetState(@SW_SHOW, $Nachricht)
;~ 					case "bluemld"
;~ 						GUICtrlSetData($Chatpartner, "Daniel")
;~ 						GUISetState(@SW_SHOW, $Nachricht)
;~ 					case "herbstt"
;~ 						GUICtrlSetData($Chatpartner, "Thomas H.")
;~ 						GUISetState(@SW_SHOW, $Nachricht)
;~ 					Case Else
;~ 						GUICtrlSetData($Chatpartner, @UserName)
;~ 				EndSwitch
;~ 			EndIf
;~ 		Next
    Else
        GUICtrlSetState($speichern, $GUI_ENABLE)
    EndIf

    Sleep(100) ; wichtig für Systementlastung
WEnd

; Hilfsfunktion zur Farbsetzung
Func _SetUserColor($filename, $ctrlID)
    If _ArraySearch($onlineuser, $filename) >= 0 Then
        GUICtrlSetBkColor($ctrlID, 0x00FF00)
    Else
        GUICtrlSetBkColor($ctrlID, 0xFF0000)
    EndIf
EndFunc

Func _CloseGUI1()
	FileDelete(@ScriptDir & "<REDACTED>\" & @UserName & ".txt")
	Exit
EndFunc   ;==>_CloseGUI1

Func Netzlaufwerk_LAN_01_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED>")
EndFunc   ;==>Netzlaufwerk_LAN_01_ausfuehren

Func Netzlaufwerk_LAN_02_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED>")
EndFunc   ;==>Netzlaufwerk_LAN_02_ausfuehren

Func Netzlaufwerk_LAN_03_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED>")
EndFunc   ;==>Netzlaufwerk_LAN_03_ausfuehren

Func Netzlaufwerk_LAN_04_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED>")
EndFunc   ;==>Netzlaufwerk_LAN_04_ausfuehren

Func Netzlaufwerk_LAN_05_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED>")
EndFunc   ;==>Netzlaufwerk_LAN_05_ausfuehren

Func Fiskal_NEUERSM()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>")
EndFunc   ;==>Netzlaufwerk_LAN_07_ausfuehren

Func Prog1_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED> Kontrolle<REDACTED>")
EndFunc   ;==>Prog1_ausfuehren

Func Prog2_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED> Kontrolle<REDACTED><REDACTED> V1.1.exe")
EndFunc   ;==>Prog2_ausfuehren

Func Prog3_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>")
EndFunc   ;==>Prog3_ausfuehren

Func Prog4_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>")
EndFunc   ;==>Prog4_ausfuehren

Func Prog5_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>","","\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>\")
EndFunc   ;==>Prog5_ausfuehren

Func Prog6_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>")
EndFunc   ;==>Prog6_ausfuehren

Func Prog7_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED> Kontrolle<REDACTED><REDACTED>")
EndFunc   ;==>Prog7_ausfuehren

Func Prog8_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED> V1.1.exe")
EndFunc   ;==>Prog8_ausfuehren

Func Prog9_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>")
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>")
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>","","\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>\")
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>")
EndFunc   ;==>Prog9_ausfuehren

Func Prog10_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>")
EndFunc   ;==>Prog10_ausfuehren

Func Prog11_ausfuehren()
	_RunDos("start http://sqlrsp.netto.lan/reports/report/Oeffentlich/Filialtechnik/POS%20Umsatzdaten/Umsatzabgleich")
EndFunc   ;==>Prog11_ausfuehren

Func Prog12_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>")
EndFunc   ;==>Prog12_ausfuehren

Func Prog13_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED> V1.2.exe")
EndFunc   ;==>Prog13_ausfuehren

Func Prog14_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>")
EndFunc   ;==>Prog14_ausfuehren

Func Prog15_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>")
EndFunc   ;==>Prog15_ausfuehren

Func Prog16_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED> V1.0.exe")
EndFunc   ;==>Prog16_ausfuehren

Func Prog17_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>")
EndFunc   ;==>Prog17_ausfuehren

Func Link1()
	GUISetState(@SW_HIDE, $aPanel[2])
	GUISetState(@SW_HIDE, $aPanel[3])
	GUISetState(@SW_HIDE, $aPanel[4])
	GUISetState(@SW_HIDE, $aPanel[5])
	GUISetState(@SW_HIDE, $aPanel[6])
	GUISetState(@SW_HIDE, $aPanel[7])
	GUISetState(@SW_HIDE, $aPanel[8])
	GUISetState(@SW_HIDE, $aPanel[9])
	GUISetState(@SW_HIDE, $aPanel[10])
	GUISetState(@SW_HIDE, $aPanel[11])
	GUISetState(@SW_HIDE, $aPanel[12])
	GUISetState(@SW_HIDE, $aPanel[13])
	GUISetState(@SW_SHOW, $aPanel[1])
EndFunc   ;==>Link1

Func Link2()
	GUISetState(@SW_HIDE, $aPanel[1])
	GUISetState(@SW_HIDE, $aPanel[3])
	GUISetState(@SW_HIDE, $aPanel[4])
	GUISetState(@SW_HIDE, $aPanel[5])
	GUISetState(@SW_HIDE, $aPanel[6])
	GUISetState(@SW_HIDE, $aPanel[7])
	GUISetState(@SW_HIDE, $aPanel[8])
	GUISetState(@SW_HIDE, $aPanel[9])
	GUISetState(@SW_HIDE, $aPanel[10])
	GUISetState(@SW_HIDE, $aPanel[11])
	GUISetState(@SW_HIDE, $aPanel[12])
	GUISetState(@SW_HIDE, $aPanel[13])
	GUISetState(@SW_SHOW, $aPanel[2])
EndFunc   ;==>Link2

Func Link3()
	GUISetState(@SW_HIDE, $aPanel[1])
	GUISetState(@SW_HIDE, $aPanel[2])
	GUISetState(@SW_HIDE, $aPanel[4])
	GUISetState(@SW_HIDE, $aPanel[5])
	GUISetState(@SW_HIDE, $aPanel[6])
	GUISetState(@SW_HIDE, $aPanel[7])
	GUISetState(@SW_HIDE, $aPanel[8])
	GUISetState(@SW_HIDE, $aPanel[9])
	GUISetState(@SW_HIDE, $aPanel[10])
	GUISetState(@SW_HIDE, $aPanel[11])
	GUISetState(@SW_HIDE, $aPanel[12])
	GUISetState(@SW_HIDE, $aPanel[13])
	GUISetState(@SW_SHOW, $aPanel[3])
EndFunc   ;==>Link3

Func Link4()
	GUISetState(@SW_HIDE, $aPanel[1])
	GUISetState(@SW_HIDE, $aPanel[2])
	GUISetState(@SW_HIDE, $aPanel[3])
	GUISetState(@SW_HIDE, $aPanel[5])
	GUISetState(@SW_HIDE, $aPanel[6])
	GUISetState(@SW_HIDE, $aPanel[7])
	GUISetState(@SW_HIDE, $aPanel[8])
	GUISetState(@SW_HIDE, $aPanel[9])
	GUISetState(@SW_HIDE, $aPanel[10])
	GUISetState(@SW_HIDE, $aPanel[11])
	GUISetState(@SW_HIDE, $aPanel[12])
	GUISetState(@SW_HIDE, $aPanel[13])
	GUISetState(@SW_SHOW, $aPanel[4])
EndFunc   ;==>Link4

Func Link5()
	GUISetState(@SW_HIDE, $aPanel[1])
	GUISetState(@SW_HIDE, $aPanel[2])
	GUISetState(@SW_HIDE, $aPanel[3])
	GUISetState(@SW_HIDE, $aPanel[4])
	GUISetState(@SW_HIDE, $aPanel[6])
	GUISetState(@SW_HIDE, $aPanel[7])
	GUISetState(@SW_HIDE, $aPanel[8])
	GUISetState(@SW_HIDE, $aPanel[9])
	GUISetState(@SW_HIDE, $aPanel[10])
	GUISetState(@SW_HIDE, $aPanel[11])
	GUISetState(@SW_HIDE, $aPanel[12])
	GUISetState(@SW_HIDE, $aPanel[13])
	GUISetState(@SW_SHOW, $aPanel[5])
EndFunc   ;==>Link5

Func Link6()
	GUISetState(@SW_HIDE, $aPanel[1])
	GUISetState(@SW_HIDE, $aPanel[2])
	GUISetState(@SW_HIDE, $aPanel[3])
	GUISetState(@SW_HIDE, $aPanel[4])
	GUISetState(@SW_HIDE, $aPanel[5])
	GUISetState(@SW_HIDE, $aPanel[7])
	GUISetState(@SW_HIDE, $aPanel[8])
	GUISetState(@SW_HIDE, $aPanel[9])
	GUISetState(@SW_HIDE, $aPanel[10])
	GUISetState(@SW_HIDE, $aPanel[11])
	GUISetState(@SW_HIDE, $aPanel[12])
	GUISetState(@SW_HIDE, $aPanel[13])
	GUISetState(@SW_SHOW, $aPanel[6])
EndFunc   ;==>Link6

Func Link7()
	GUISetState(@SW_HIDE, $aPanel[1])
	GUISetState(@SW_HIDE, $aPanel[2])
	GUISetState(@SW_HIDE, $aPanel[3])
	GUISetState(@SW_HIDE, $aPanel[4])
	GUISetState(@SW_HIDE, $aPanel[5])
	GUISetState(@SW_HIDE, $aPanel[6])
	GUISetState(@SW_HIDE, $aPanel[8])
	GUISetState(@SW_HIDE, $aPanel[9])
	GUISetState(@SW_HIDE, $aPanel[10])
	GUISetState(@SW_HIDE, $aPanel[11])
	GUISetState(@SW_HIDE, $aPanel[12])
	GUISetState(@SW_HIDE, $aPanel[13])
	GUISetState(@SW_SHOW, $aPanel[7])
EndFunc   ;==>Link7

Func Link8()
	GUISetState(@SW_HIDE, $aPanel[1])
	GUISetState(@SW_HIDE, $aPanel[2])
	GUISetState(@SW_HIDE, $aPanel[3])
	GUISetState(@SW_HIDE, $aPanel[4])
	GUISetState(@SW_HIDE, $aPanel[5])
	GUISetState(@SW_HIDE, $aPanel[6])
	GUISetState(@SW_HIDE, $aPanel[7])
	GUISetState(@SW_HIDE, $aPanel[9])
	GUISetState(@SW_HIDE, $aPanel[10])
	GUISetState(@SW_HIDE, $aPanel[11])
	GUISetState(@SW_HIDE, $aPanel[12])
	GUISetState(@SW_HIDE, $aPanel[13])
	GUISetState(@SW_SHOW, $aPanel[8])
EndFunc   ;==>Link8

Func Link9()
	GUISetState(@SW_HIDE, $aPanel[1])
	GUISetState(@SW_HIDE, $aPanel[2])
	GUISetState(@SW_HIDE, $aPanel[3])
	GUISetState(@SW_HIDE, $aPanel[4])
	GUISetState(@SW_HIDE, $aPanel[5])
	GUISetState(@SW_HIDE, $aPanel[6])
	GUISetState(@SW_HIDE, $aPanel[7])
	GUISetState(@SW_HIDE, $aPanel[8])
	GUISetState(@SW_HIDE, $aPanel[10])
	GUISetState(@SW_HIDE, $aPanel[11])
	GUISetState(@SW_HIDE, $aPanel[12])
	GUISetState(@SW_HIDE, $aPanel[13])
	GUISetState(@SW_SHOW, $aPanel[9])
EndFunc   ;==>Link9

Func Link10()
	GUISetState(@SW_HIDE, $aPanel[1])
	GUISetState(@SW_HIDE, $aPanel[2])
	GUISetState(@SW_HIDE, $aPanel[3])
	GUISetState(@SW_HIDE, $aPanel[4])
	GUISetState(@SW_HIDE, $aPanel[5])
	GUISetState(@SW_HIDE, $aPanel[6])
	GUISetState(@SW_HIDE, $aPanel[7])
	GUISetState(@SW_HIDE, $aPanel[8])
	GUISetState(@SW_HIDE, $aPanel[9])
	GUISetState(@SW_HIDE, $aPanel[11])
	GUISetState(@SW_HIDE, $aPanel[12])
	GUISetState(@SW_HIDE, $aPanel[13])
	GUISetState(@SW_SHOW, $aPanel[10])
EndFunc   ;==>Link10

Func Link11()
	GUISetState(@SW_HIDE, $aPanel[1])
	GUISetState(@SW_HIDE, $aPanel[2])
	GUISetState(@SW_HIDE, $aPanel[3])
	GUISetState(@SW_HIDE, $aPanel[4])
	GUISetState(@SW_HIDE, $aPanel[5])
	GUISetState(@SW_HIDE, $aPanel[6])
	GUISetState(@SW_HIDE, $aPanel[7])
	GUISetState(@SW_HIDE, $aPanel[8])
	GUISetState(@SW_HIDE, $aPanel[9])
	GUISetState(@SW_HIDE, $aPanel[10])
	GUISetState(@SW_HIDE, $aPanel[12])
	GUISetState(@SW_HIDE, $aPanel[13])
	GUISetState(@SW_SHOW, $aPanel[11])
EndFunc   ;==>Link11

Func Link12()
	GUISetState(@SW_HIDE, $aPanel[1])
	GUISetState(@SW_HIDE, $aPanel[2])
	GUISetState(@SW_HIDE, $aPanel[3])
	GUISetState(@SW_HIDE, $aPanel[4])
	GUISetState(@SW_HIDE, $aPanel[5])
	GUISetState(@SW_HIDE, $aPanel[6])
	GUISetState(@SW_HIDE, $aPanel[7])
	GUISetState(@SW_HIDE, $aPanel[8])
	GUISetState(@SW_HIDE, $aPanel[9])
	GUISetState(@SW_HIDE, $aPanel[10])
	GUISetState(@SW_HIDE, $aPanel[11])
	GUISetState(@SW_HIDE, $aPanel[13])
	GUISetState(@SW_SHOW, $aPanel[12])
EndFunc   ;==>Link12

Func Link13()
	GUISetState(@SW_HIDE, $aPanel[1])
	GUISetState(@SW_HIDE, $aPanel[2])
	GUISetState(@SW_HIDE, $aPanel[3])
	GUISetState(@SW_HIDE, $aPanel[4])
	GUISetState(@SW_HIDE, $aPanel[5])
	GUISetState(@SW_HIDE, $aPanel[6])
	GUISetState(@SW_HIDE, $aPanel[7])
	GUISetState(@SW_HIDE, $aPanel[8])
	GUISetState(@SW_HIDE, $aPanel[9])
	GUISetState(@SW_HIDE, $aPanel[10])
	GUISetState(@SW_HIDE, $aPanel[11])
	GUISetState(@SW_HIDE, $aPanel[12])
	GUISetState(@SW_SHOW, $aPanel[13])
EndFunc   ;==>Link13

Func ausfuehren()
	_ADO_ComErrorHandler_UserFunction(_ADO_COMErrorHandler)
	Local $sDriver = 'SQL Server'
	Local $sDatabase = '<REDACTED>'
	Local $sServer = 'SQLP<REDACTED>.netto.lan,<REDACTED>'
	Local $sUser = '<REDACTED>_filialuser'
	Local $sPassword = 'xKtoT0M8ZSgHWYSH2u'

	Local $sConnectionString = 'DRIVER={' & $sDriver & '};SERVER=' & $sServer & ';DATABASE=' & $sDatabase & ';UID=' & $sUser & ';PWD=' & $sPassword & ';'
	Local $oConnection = _ADO_Connection_Create()
	_ADO_Connection_OpenConString($oConnection, $sConnectionString)
	Global $Filialen = _SQL_ADO_Execute($oConnection, "select filiale from dbo.daten_filialen_helpdesk", True)
;~ 	_ArrayDisplay($Filialen)

	$text1 = 'Der BOF Tausch ist abgeschlossen, die Kassen sind wieder online. <br><br> Mit freundlichen Grüßen <br><br>GK-Support <br>'
	$Betreff = "BOF Tausch " & GUICtrlRead($Eingabe_Filialnummer)
	$file1 = FileOpen(@ScriptDir & "<REDACTED>", 2 + 8)
	If GUICtrlRead($Eingabe_Filialnummer) <> "" Then
		If _ArraySearch($Filialen, GUICtrlRead($Eingabe_Filialnummer)) >= 0 Then
;~ 			FileWriteLine($file1, guictrlread($Eingabe_Filialnummer))
			_INetSmtpMailCom("<REDACTED>", "BOF Tausch", "gk.support@netto-online.de", "00Filialtechnik@netto-online.de", $Betreff, $text1, $AttachFiles, $CcAddress, $BccAddress, $Importance, $Username, $Password, $IPPort, $ssl)
;~ 			_INetSmtpMailCom("<REDACTED>", "BOF Tausch", "ronny.knepper@netto-online.de", "ronny.knepper@netto-online.de", $Betreff, $text1, $AttachFiles, $CcAddress, $BccAddress, $Importance, $Username, $Password, $IPPort, $ssl)
		Else
			MsgBox(64, "Fehler", "Die Filialnummer ist nicht bekannt. Bitte prüfen!")
		EndIf
	Else
		MsgBox(64, "Fehler", "Es wurde keine Filialnummer eingegeben. Bitte prüfen!")
	EndIf
EndFunc   ;==>ausfuehren

Func backup()
	$Filiale = GUICtrlRead($input_filnrbackup)
	_unicenter_sql_open()
	$array1 = _sql("SELECT [z_anz_kassen] FROM dbo.Haupttabelle WHERE [last_name] = '" & $Filiale & "'")
	_ArrayAdd($gesamt, $Filiale & '|' & $array1[0][0])
;~ 	_ArrayDisplay($gesamt)
	MsgBox($MB_SYSTEMMODAL, "Wegsichern", "Filiale: " & $Filiale & " Kassen: " & $array1[0][0], 10)
	$trim = StringStripWS($gesamt[0][0], 8)
	For $i = 1 To StringStripWS($gesamt[0][1], 8)
		_ip($trim)
		$ping = Ping('10.' & $ip & '.1' & $i, 4000)
		If $ping Then
			$text = 'NET USE \<REDACTED> & $ip & '.1' & $i & '<REDACTED> /USER:NettoTPOS gato8*opak4-l4ri5' & @CRLF
			$text &= 'ren \<REDACTED> & $ip & '.1' & $i & '<REDACTED><REDACTED><REDACTED><REDACTED> backup_old_old' & @CRLF
			$text &= 'ren \<REDACTED> & $ip & '.1' & $i & '<REDACTED><REDACTED><REDACTED><REDACTED> backup_old' & @CRLF
			$text &= "NET USE \<REDACTED>" & $ip & ".1" & $i & "<REDACTED> /D"
			FileWriteLine(@ScriptDir & "<REDACTED><REDACTED>" & $trim & "_1" & $i & ".bat", $text)
			Run(@ComSpec & " /c " & @ScriptDir & "<REDACTED><REDACTED>" & $trim & "_1" & $i & ".bat", "", @SW_HIDE)
			MsgBox($MB_SYSTEMMODAL, "Backup", "Backup weggesichert.", 10)
			ConsoleWrite(@ScriptDir & "<REDACTED><REDACTED>" & $trim & "_1" & ".bat" & @CRLF)
			FileWriteLine(@ScriptDir & "<REDACTED>", @YEAR & "-" & @MON & "-" & @MDAY & " " & @HOUR & ":" & @MIN & " ; " & $trim & "_1" & $i & " gestartet")
		Else
			MsgBox($MB_SYSTEMMODAL, "Backup", "Backup NICHT! weggesichert.", 120)
		EndIf
	Next
	_ArrayDelete($gesamt, 0)
EndFunc   ;==>backup

Func absenden()

	$Fehler_Combo1 = False
	$Fehler_FilNr = False
	$Fehler_Kasse = False
	$Fehler_Datum = False
	$Fehler_Beschreibung = False

	If StringLen(GUICtrlRead($Combo1)) < 1 Then
		$Fehler_Combo1 = True
	EndIf
	If StringLen(GUICtrlRead($input_filnr)) <> 4 Then
		$Fehler_FilNr = True
	EndIf
	If StringLen(GUICtrlRead($input_kasse)) < 1 Then
		$Fehler_Kasse = True
	EndIf
	If StringLen(GUICtrlRead($input_datumuhrzeit)) < 8 Then
		$Fehler_Datum = True
	EndIf
	If StringLen(GUICtrlRead($beschreibung)) < 1 Then
		$Fehler_Beschreibung = True
	EndIf

	If $Fehler_Combo1 = False And $Fehler_Beschreibung = False And $Fehler_Datum = False And $Fehler_FilNr = False And $Fehler_Kasse = False Then
		Local $Inhalt


		$Betreff = "Störmeldung Online-/Prepaidprodukte"

		$Inhalt = 'Sehr geehrte Damen und Herren, <br>'

		$Inhalt = $Inhalt & '<br> Filialnummer: ' & GUICtrlRead($input_filnr)
		$Inhalt = $Inhalt & '<br> Kasse: ' & GUICtrlRead($input_kasse)
		$Inhalt = $Inhalt & '<br> Datum/Uhrzeit: ' & GUICtrlRead($input_datumuhrzeit)
		$Inhalt = $Inhalt & '<br> EAN-Code: ' & GUICtrlRead($Combo2)
		$Inhalt = $Inhalt & '<br> Seriennummer: ' & GUICtrlRead($input_seriennr)
		$Inhalt = $Inhalt & '<br> Betroffenes Produkt: ' & GUICtrlRead($Combo3)
		$Inhalt = $Inhalt & '<br> Störfallbeschreibung: ' & GUICtrlRead($beschreibung) & '<br>'

		$Inhalt = $Inhalt & '<br> mit der Bitte um Prüfung und Rückmeldung an den GK.Support@Netto-online.de. <br> <br>'

;~ 		_INetSmtpMailCom("<REDACTED>", "Störmeldung Online-/Prepaidprodukte", "GK.Support@Netto-online.de", "Christian.<REDACTED>@Netto-online.de", $Betreff, $Inhalt, $AttachFiles, "GK.Support@Netto-online.de", $BccAddress, $Importance, $Username, $Password, $IPPort, $ssl)
		_INetSmtpMailCom("<REDACTED>", "Störmeldung Online-/Prepaidprodukte", "GK.Support@Netto-online.de", GUICtrlRead($Combo1), $Betreff, $Inhalt, $AttachFiles, "GK.Support@Netto-online.de", $BccAddress, $Importance, $Username, $Password, $IPPort, $ssl)

		MsgBox(64, "Hinweis", "E-Mail Versendet!")

	Else
		If $Fehler_Combo1 = True Then
			MsgBox(64, "Hinweis", "Bitte Anbieter prüfen")
		EndIf
		If $Fehler_FilNr = True Then
			MsgBox(64, "Hinweis", "Bitte Filialnummer überprüfen")
		EndIf
		If $Fehler_Kasse = True Then
			MsgBox(64, "Hinweis", "Bitte Kasse Überprüfen")
		EndIf
		If $Fehler_Datum = True Then
			MsgBox(64, "Hinweis", "Bitte Datum überprüfen")
		EndIf
		If $Fehler_Beschreibung = True Then
			MsgBox(64, "Hinweis", "Bitte die Beschreibung prüfen")
		EndIf
	EndIf

		GUICtrlSetData($input_filnr, "")
		GUICtrlSetData($input_kasse, "")
		GUICtrlSetData($input_datumuhrzeit, "")
		GUICtrlSetData($Combo2, "")
		GUICtrlSetData($input_seriennr, "")
		GUICtrlSetData($Combo3, "")
		GUICtrlSetData($beschreibung, "")

EndFunc   ;==>absenden

Func WechselkursCHF()
	Const $HTTPREQUEST_PROXYSETTING_PROXY = 2
	Local $o_HTTP = ObjCreate('winhttp.winhttprequest.5.1')
			  $o_HTTP.SetProxy($HTTPREQUEST_PROXYSETTING_PROXY, '<REDACTED>:8080', '')

	 Local $sAPIKey = "39782b46bbf97ed32b6bfb25ba1cedf7" ; Sie benötigen einen kostenlosen API-Schlüssel von exchangeratesapi.io

	 Local $sBaseCurrency = "EUR"

			  $o_HTTP.Open('GET', 'https://open.er-api.com/v6/latest/' & $sBaseCurrency & '?apikey=' & $sAPIKey, False)
			  $o_HTTP.SetRequestHeader('accept', 'application/json')
			  $o_HTTP.Send('https://open.er-api.com/v6/latest/' & $sBaseCurrency & '?apikey=' & $sAPIKey)
			  $o_HTTP.WaitForResponse(-1)

			  Local $winHTTP_JSON_Response = $o_HTTP.ResponseText

	$CHF=StringSplit($winHTTP_JSON_Response,"CHF",1)
	$CHF=StringTrimLeft($CHF[2],2)
	$CHF=StringLeft($CHF,8)

    ; Berechnen des angepassten Kurses
    $angepassterKursCHF = StringFormat("%.3f", $CHF + 0.032)

    MsgBox(64, "Wechselkurs Schweizer Franken", "Kurs: " & $CHF & @CRLF & "Kurs wurde um 0,032€ angepasst: " & $angepassterKursCHF)

EndFunc   ;==>WechselkursCHF

Func WechselkursDKK()
	Const $HTTPREQUEST_PROXYSETTING_PROXY = 2
	Local $o_HTTP = ObjCreate('winhttp.winhttprequest.5.1')
			  $o_HTTP.SetProxy($HTTPREQUEST_PROXYSETTING_PROXY, '<REDACTED>:8080', '')

	 Local $sAPIKey = "39782b46bbf97ed32b6bfb25ba1cedf7" ; Sie benötigen einen kostenlosen API-Schlüssel von exchangeratesapi.io

	 Local $sBaseCurrency = "EUR"

			  $o_HTTP.Open('GET', 'https://open.er-api.com/v6/latest/' & $sBaseCurrency & '?apikey=' & $sAPIKey, False)
			  $o_HTTP.SetRequestHeader('accept', 'application/json')
			  $o_HTTP.Send('https://open.er-api.com/v6/latest/' & $sBaseCurrency & '?apikey=' & $sAPIKey)
			  $o_HTTP.WaitForResponse(-1)

			  Local $winHTTP_JSON_Response = $o_HTTP.ResponseText

	$DKK=StringSplit($winHTTP_JSON_Response,"DKK",1)
	$DKK=StringTrimLeft($DKK[2],2)
	$DKK=StringLeft($DKK,8)

    ; Berechnen des angepassten Kurses
    $angepassterKursDKK = StringFormat("%.3f", $DKK + 0.032)

    MsgBox(64, "Wechselkurs DKK", "Kurs: " & $DKK & @CRLF & "Kurs wurde um 0,032€ angepasst: " & $angepassterKursDKK)

EndFunc   ;==>WechselkursDKK

Func _AddNewLink($sTxt, $iIcon = -44)
	Local $hLink = GUICtrlCreateLabel($sTxt, 36, $iT + $iGap, $iLeftWidth - 46, 17)
	GUICtrlSetCursor(-1, 0)
	GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
	GUICtrlCreateIcon("shell32.dll", $iIcon, 10, $iT + $iGap, 16, 16)
	GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
	$iGap += 22
	Return $hLink
EndFunc   ;==>_AddNewLink

Func _AddNewPanel($sTxt)
	Local $gui = GUICreate("", $iW - $iLeftWidth + 2, $iH - $iT - $iB, $iLeftWidth + 2, $iT, $WS_CHILD + $WS_VISIBLE, -1, $hMainGUI)
	GUICtrlCreateLabel($sTxt, 10, 10, $iW - $iLeftWidth - 20, 17, $SS_CENTERIMAGE)
	GUICtrlSetFont(-1, 9, 800, 4, "Arial", 5)
	GUICtrlSetResizing(-1, $GUI_DOCKTOP + $GUI_DOCKLEFT + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
	Return $gui
EndFunc   ;==>_AddNewPanel

Func _AddControlsToPanel($hPanel)
	GUISwitch($hPanel)
EndFunc   ;==>_AddControlsToPanel

Func senden()
    $Filelist = _FileListToArray(@ScriptDir & "<REDACTED>", "*.txt")
    $Alter_Inhalt = FileRead(@ScriptDir & "<REDACTED>\" & $Filelist[UBound($Filelist) - 1])
    $Neuer_Inhalt = FileOpen(@ScriptDir & "<REDACTED><REDACTED>" & @YEAR & @MON & @MDAY & @HOUR & @MIN & @SEC & ".txt", 2 + 8)
    FileWrite($Neuer_Inhalt, $Alter_Inhalt & @CRLF)
    FileClose($Neuer_Inhalt) ; Close the file handle
    Switch @UserName
        Case "<REDACTED>c"
            $Benutzer = "Christian"
        Case "freyt"
            $Benutzer = "Tom"
        Case "dorfnerh"
            $Benutzer = "Herbert"
        Case "dresches"
            $Benutzer = "Sabrina"
        Case "bluemld"
            $Benutzer = "Daniel"
        Case "gleditza"
            $Benutzer = "Andreas"
		Case "heinemanns"
            $Benutzer = "Stephan"
		Case "karlj"
            $Benutzer = "Julia"
        Case "meierm"
            $Benutzer = "Maximilian"
	    Case "rauscht"
            $Benutzer = "Tobias"
		Case Else
            $Benutzer = @UserName
    EndSwitch
    GUICtrlSetData($Textnachricht, "")
EndFunc   ;==>senden

Func speichern()
    Local $Neuer_Inhalt
    $Neuer_Inhalt = FileOpen(@ScriptDir & "<REDACTED><REDACTED>" & @YEAR & @MON & @MDAY & @HOUR & @MIN & @SEC & ".txt", 2 + 8)
    FileWrite($Neuer_Inhalt, GUICtrlRead($Aufgaben_edit))
    FileClose($Neuer_Inhalt) ; Close the file handle
EndFunc   ;==>speichern

Func Terminplan_oeffnen()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED>")
EndFunc   ;==>Terminplan_oeffnen

Func Anleitungen_oeffnen_GK()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>")
EndFunc   ;==>Anleitungen<REDACTED>oeffnen

Func Anleitungen_oeffnen_ECTMZ_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>")
EndFunc   ;==>AnleitungenECMZ_oeffnen

Func private_Message_Christian()
	FileOpen(@ScriptDir & "<REDACTED>\" & @UserName & "_<REDACTED>c.txt", 2 + 8)
	GUICtrlSetData($Chatpartner, "Christian")
	GUISetState(@SW_SHOW, $Nachricht)
EndFunc   ;==>private_Message_Christian

Func private_Message_Daniel()
	$Inhalt = FileOpen(@ScriptDir & "<REDACTED>\" & @UserName & "_bluemld.txt", 2 + 8)
	GUICtrlSetData($Chatpartner, "Daniel")
	GUISetState(@SW_SHOW, $Nachricht)
EndFunc   ;==>private_Message_Daniel

Func private_Message_Sabrina()
	$Inhalt = FileOpen(@ScriptDir & "<REDACTED>\" & @UserName & "_dresches.txt", 2 + 8)
	GUICtrlSetData($Chatpartner, "Sabrina")
	GUISetState(@SW_SHOW, $Nachricht)
EndFunc   ;==>private_Message_Sabrina

Func private_Message_Herbert()
	$Inhalt = FileOpen(@ScriptDir & "<REDACTED>\" & @UserName & "_dorfnerh.txt", 2 + 8)
	GUICtrlSetData($Chatpartner, "Herbert")
	GUISetState(@SW_SHOW, $Nachricht)
EndFunc   ;==>private_Message_Herbert

Func private_Message_TomF()
	$Inhalt = FileOpen(@ScriptDir & "<REDACTED>\" & @UserName & "_freyt.txt", 2 + 8)
	GUICtrlSetData($Chatpartner, "Thomas F.")
	GUISetState(@SW_SHOW, $Nachricht)
EndFunc   ;==>private_Message_TomF

Func private_Message_Andreas()
	$Inhalt = FileOpen(@ScriptDir & "<REDACTED>\" & @UserName & "_gleditza.txt", 2 + 8)
	GUICtrlSetData($Chatpartner, "Andreas")
	GUISetState(@SW_SHOW, $Nachricht)
EndFunc   ;==>private_Message_Andreas

Func private_Message_Stephan()
	$Inhalt = FileOpen(@ScriptDir & "<REDACTED>\" & @UserName & "_heinemanns.txt", 2 + 8)
	GUICtrlSetData($Chatpartner, "Stephan")
	GUISetState(@SW_SHOW, $Nachricht)
EndFunc   ;==>private_Message_Stephan

Func private_Message_Julia()
	$Inhalt = FileOpen(@ScriptDir & "<REDACTED>\" & @UserName & "_karlj.txt", 2 + 8)
	GUICtrlSetData($Chatpartner, "Julia")
	GUISetState(@SW_SHOW, $Nachricht)
EndFunc   ;==>private_Message_Julia

Func private_Message_Maximilian()
	$Inhalt = FileOpen(@ScriptDir & "<REDACTED>\" & @UserName & "_meierm.txt", 2 + 8)
	GUICtrlSetData($Chatpartner, "Maximilian")
	GUISetState(@SW_SHOW, $Nachricht)
EndFunc   ;==>private_Message_Maximilian

Func private_Message_Tobias()
	$Inhalt = FileOpen(@ScriptDir & "<REDACTED>\" & @UserName & "_rauscht.txt", 2 + 8)
	GUICtrlSetData($Chatpartner, "Tobias")
	GUISetState(@SW_SHOW, $Nachricht)
EndFunc   ;==>private_Message_Tobias

Func _CloseGUI2()
	GUISetState(@SW_HIDE, $Nachricht)
EndFunc   ;==>_CloseGUI2

Func _unicenter_sql_open()
	Global $db = ObjCreate("ADODB.Connection")
	With $db
		.Provider = "SQLOLEDB.1"
		.Properties("Persist Security Info").Value = False
		.Properties("Initial Catalog").Value = "mdb"
		.Properties("Data Source").Value = "SQLPMDB,<REDACTED>"
		.Properties("User Id").Value = "CTI"
		.Properties("Password").Value = "unicenter01"
		.Open
	EndWith
EndFunc   ;==>_unicenter_sql_open

Func _sql($query)
	If StringLeft($query, 3) = "SEL" Then
		$rs = $db.execute($query)
		If Not $rs.EOF Then
			$query_ergebnis = $rs.getrows
		Else
			Dim $query_ergebnis[1][1]
			$query_ergebnis[0][0] = ""
		EndIf
		Return $query_ergebnis
	Else
		$query_ergebnis = $db.execute($query)
		If @error Then
			Return -2
		Else
			Return 0
		EndIf
	EndIf
EndFunc   ;==>_sql

Func _unicenter_sql_close()
	$db.close
EndFunc   ;==>_unicenter_sql_close

Func _ip($trim)
	$iprightmit = StringTrimLeft($trim, 2)
	$ipleft = StringTrimRight($trim, 2)

	$iprightsplit1 = StringTrimLeft($iprightmit, 1)
	$iprightsplit2 = StringTrimRight($iprightmit, 1)
	If $iprightsplit2 = "0" Then $iprightsplit2 = ""

	$ip = $ipleft & "." & $iprightsplit2 & $iprightsplit1
EndFunc   ;==>_ip

Func Ordner<REDACTED>ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>")
EndFunc   ;==>OrdnerGK

Func OrdnerECTMZ_1_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>")
EndFunc   ;==>OrdnerECMTZ_1

Func OrdnerECTMZ_2_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>")
EndFunc   ;==>OrdnerECTMZ_2

Func wichtige_Dokumente_01_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>")
EndFunc   ;==>wichtige_Dokumente_01_ausfuehren

Func wichtige_Dokumente_02_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>")
EndFunc   ;==>wichtige_Dokumente_02_ausfuehren

Func wichtige_Dokumente_03_ausfuehren()
	ShellExecute("\<REDACTED><REDACTED><REDACTED><REDACTED><REDACTED><REDACTED>")
EndFunc   ;==>wichtige_Dokumente_01_ausfuehren

Func RemoteDesktop_01_ausfuehren()
	ShellExecute("C:<REDACTED><REDACTED><REDACTED>")
	    Sleep(600)
    Send("n01storep-02v" & "{enter}")
EndFunc   ;==>RemoteDesktop_01_ausfuehren

Func RemoteDesktop_02_ausfuehren()
	ShellExecute("C:<REDACTED><REDACTED><REDACTED>")
	    Sleep(600)
    Send("N01GKSRV-03V" & "{enter}")
EndFunc   ;==>RemoteDesktop_02_ausfuehren

Func RemoteDesktop_03_ausfuehren()
	ShellExecute("C:<REDACTED><REDACTED><REDACTED>")
	    Sleep(600)
    Send("N01StoreT-03V" & "{enter}")
EndFunc   ;==>RemoteDesktop_03_ausfuehren

Func RemoteDesktop_04_ausfuehren()
	ShellExecute("C:<REDACTED><REDACTED><REDACTED>")
	    Sleep(600)
    Send("N01TSPrisma-01V" & "{enter}")
EndFunc   ;==>RemoteDesktop_04_ausfuehren

Func RemoteDesktop_05_ausfuehren()
	ShellExecute("C:<REDACTED><REDACTED><REDACTED>")
	    Sleep(600)
    Send("n01gksrv-05v" & "{enter}")
EndFunc   ;==>RemoteDesktop_05_ausfuehren

Func RemoteDesktop_06_ausfuehren()
	ShellExecute("C:<REDACTED><REDACTED><REDACTED>")
	    Sleep(600)
    Send("n01GKsupp-01v" & "{enter}")
EndFunc   ;==>RemoteDesktop_06_ausfuehren

Func RemoteDesktop_07_ausfuehren()
	ShellExecute("C:<REDACTED><REDACTED><REDACTED>")
	    Sleep(600)
    Send("N01TSFilRDP-02V.netto.lan" & "{enter}")
EndFunc   ;==>RemoteDesktop_07_ausfuehren

Func Webinterface_01_ausfuehren()
    ShellExecute("http://<REDACTED>:8080/app-svs/gkr-svs")
EndFunc

Func Webinterface_02_ausfuehren()
    ShellExecute("http://<REDACTED>:8080/app-cpd/gkr-cpd")
EndFunc

Func Webinterface_03_ausfuehren()
    ShellExecute("https://n01webadmp-01v/Account/Login?ReturnUrl=%2f")
EndFunc

Func Webinterface_04_ausfuehren()
    ShellExecute("https://fxtop.com/de/vergangene-rechner.php?A=100&C1=CHF&C2=EUR&DD=07&MM=10&YYYY=2020&B=1&P=&I=1&btnOK=Gehen")
EndFunc

Func Webinterface_05_ausfuehren()
    ShellExecute("http://webfilp.netto.lan/auswertung/index.php?auswertung=auswertung_<REDACTED>groesse_der_datenbanken")
EndFunc

Func Webinterface_06_ausfuehren()
    ShellExecute("https://crmcockpit.netto.lan/startseite")
EndFunc

Func Webinterface_07_ausfuehren()
    ShellExecute("https://sqlrsp/ReportS/powerbi/Oeffentlich/Filialtechnik/HaushaltsueblicheMengen/HaushaltsueblicheMengen")
EndFunc

Func Webinterface_08_ausfuehren()
    ShellExecute("http://n01gksupp-01v:8088/")
EndFunc

Func Webinterface_09_ausfuehren()
    ShellExecute("https://business-login.telekom.de/auth/realms/tsystems-customer-k2/protocol/openid-connect/auth?scope=openid&state=5VTgGeVE2MM7WMrwRUvKheDrZ0w_P8KpBgcTrp_-ey8.NCjEouLpnfY.F4dhaRmpQQyJplcc7lGC2g&response_type=code&client_id=prod-telekom-customer-k2&redirect_uri=https%3A%2F%2Fbusiness-login.telekom.de%2Fauth%2Frealms%2Ftelekom-customer-k2%2Fbroker%2Fprod-tsi-customer-k2%2Fendpoint&nonce=gblQJ1hEJYriMZpxMY04aQ")
EndFunc

Func Webinterface_10_ausfuehren()
    ShellExecute("http://sqlrsp.netto.lan/reports/report/Oeffentlich/Filialtechnik/EcKartenDaten/Ec_Kartendaten")
EndFunc

Func Webinterface_11_ausfuehren()
    ShellExecute("http://sqlrsp.netto.lan/reports/report/Oeffentlich/Filialtechnik/Kreditkartendaten/Recherche_Kreditkartendaten")
EndFunc

Func Webinterface_12_ausfuehren()
    ShellExecute("https://www.serviceportal.mc.ingenico.com/auth/realms/ips-pcs/protocol/openid-connect/auth?client_id=portal&redirect_uri=https%3A%2F%2Fwww.serviceportal.mc.ingenico.com%2F%23%2F&state=6e366c3a-2bab-4fd1-8d47-80885e51490c&response_mode=fragment&response_type=code&scope=openid&nonce=095bceb5-5de9-4ddd-8288-5b2485908811")
EndFunc

Func iCopy_001()
   ClipPut(GUICtrlRead($iEdit_001))
EndFunc   ;==>iCopy_001 Button und $iEdit_001

Func iCopy_002()
   ClipPut(GUICtrlRead($iEdit_002))
EndFunc   ;==>iCopy_002 Button und $iEdit_002

Func iCopy_003()
   ClipPut(GUICtrlRead($sqlt<REDACTED><REDACTED>))
EndFunc   ;==>iCopy_003 Button und $iEdit_003

Func iCopy_004()
   ClipPut(GUICtrlRead($SQLP<REDACTED>SQLP<REDACTED><REDACTED>_1))
EndFunc   ;==>iCopy_004 Button und $iEdit_004

Func iCopy_005()
   ClipPut("<REDACTED>")
EndFunc   ;==>iCopy_005 Button und direkter ClipPut Input

Func iCopy_006()
   ClipPut("<REDACTED>")
EndFunc   ;==>iCopy_006 Button und direkter ClipPut Input

Func iCopy_007()
   ClipPut(GUICtrlRead($SQLP<REDACTED>SQLP<REDACTED><REDACTED>_2))
EndFunc   ;==>iCopy_004 Button und $iEdit_004

Func iCopy_008()
   ClipPut("<REDACTED>")
EndFunc   ;==>iCopy_008 Button und direkter ClipPut Input

Func iCopy_009()
   ClipPut("<REDACTED>")
EndFunc   ;==>iCopy_009 Button und direkter ClipPut Input

Func iCopy_010()
   ClipPut(GUICtrlRead($<REDACTED>_<REDACTED>))
EndFunc   ;==>iCopy_010 Button und $iEdit_001

Func iCopy_011()
   ClipPut(GUICtrlRead($SQLPLeergut_<REDACTED>))
EndFunc   ;==>iCopy_011 Button und $iEdit_001

;~ Func iCopy_012()
;~    ClipPut(GUICtrlRead($SQLP<REDACTED>SQLP<REDACTED><REDACTED>_3))
;~ EndFunc   ;==>iCopy_012 Button und $iEdit_004

Func iCopy_013()
   ClipPut("netto")
EndFunc   ;==>iCopy_013 Button und direkter ClipPut Input

Func iCopy_014()
   ClipPut("netto")
EndFunc   ;==>iCopy_014 Button und direkter ClipPut Input

Func Fiskal_Interface_01()
	_RunDos("start https://fiskal.cloud/api/management-ui/dashboard/statistics")
EndFunc   ;==>Fiskal_Interface_01_ausfuehren

Func Fiskal_Interface_02()
	_RunDos("start http://webfilp.netto.lan/auswertung/index.php?auswertung=auswertung_filiale_ip_adressen" & """&device=bof""")
EndFunc   ;==>Fiskal_Interface_02_ausfuehren

Func Fiskal_Interface_03()
	_RunDos("start http://webfilp.netto.lan/auswertung/index.php?auswertung=auswertung_buero_bof_status_fiskal_cloud_erreichbarkeit")
EndFunc   ;==>Fiskal_Interface_03_ausfuehren
