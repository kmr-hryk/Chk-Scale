#�����l�̃Z�b�g
#CAD�̏c���̏k�ڂ������ꍇ�ɂ̂݌v�Z���ł��܂��B

#�k�ڂ̕����񂪋L�^����Ă���ʒu�̍��W���Z�b�g����
$strlocate = "'341.750000','230.750000'"
#�擾������CAD���W�n�̖��̂��Z�b�g����
$strLayer = "���ʐ}"


#�����̊J�n
$filename = $ARGS[0]

#SXF�t�@�C������k�ڂ̕����񂪋L�^���ꂽ�s�����o��
$strSyuku = Get-Content $filename | Select-String "text_string_feature" | Select-String $strlocate

#�k�ڂ̕����񂾂������o��
$strSyuku = $strSyuku -Split ","
$strSyuku = $strSyuku[3].Replace("\'","")

#SXF�t�@�C������CAD���W�n�̏k�ڂ��L�^���ꂽ�s�����o��
$calSyuku = Get-Content $filename | Select-String "sfig_locate_feature" | Select-String $strLayer

#�k�ڂ��v�Z����
$calSyuku = $calSyuku -Split ","
$calSyuku = $calSyuku[5].Replace("'","")
$calSyuku = [int][math]::Pow([double]$calSyuku,-1)

#�k�ڂ��r����
if ($strSyuku -eq $calSyuku) {
   Write-Output "Match.`nFilename:$filename`nScale:1/$calSyuku"
}else{
   $tmpColor = (Get-Host).UI.RawUI.ForegroundColor
   (Get-Host).UI.RawUI.ForegroundColor = "Red"
   Write-Output "Unmath.`nFilename:$filename`nPaper:1/$strSyuku`nCal:1/$calSyuku"
   (Get-Host).UI.RawUI.ForegroundColor = $tmpColor
}