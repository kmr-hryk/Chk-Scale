#�����l�̃Z�b�g
#�k�ڂ̕����񂪋L�^����Ă���ʒu�̍��W���Z�b�g����
$strlocate = "'341.750000','230.750000'"
#�擾������CAD���W�n�̖��̂��Z�b�g����
$strLayer = "���ʐ}"

#�����̊J�n

#SXF�t�@�C������k�ڂ̕����񂪋L�^���ꂽ�s�����o��
$strSyuku = Get-Content $ARGS[0] | Select-String "text_string_feature" | Select-String $strlocate

#�k�ڂ̕����񂾂������o��
$strSyuku = $strSyuku -Split ","
$strSyuku = $strSyuku[3].Replace("\'","")

#