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
$mathSyuku = Get-Content $filename | Select-String "sfig_locate_feature" | Select-String $strLayer

#�k�ڂ��v�Z����
$mathSyuku = $mathSyuku -Split ","
$mathSyuku = $mathSyuku[5].Replace("'","")
$mathSyuku = [int][math]::Pow([double]$mathSyuku,-1)

if ($strSyuku -eq $mathSyuku) {
   Write-Output "�������k�ڂ��L�^����Ă��܂�`nFilename:$filename`nScale:1/$mathSyuku"
}else{
   Write-Output "�k�ڂ��قȂ��Ă��܂�`nFilename:$filename`nPaper:1/$strSyuku`nCal:1/$mathSyuku"
}