#�k�ڂ̕����񂪋L�^����Ă���ʒu�̍��W���Z�b�g����
$strlocate = "'341.750000','230.750000'"

#SXF�t�@�C������k�ڂ̕����񂪋L�^���ꂽ�s�����o��
$strSyuku = Get-Content $ARGS[0] | Select-String "text_string_feature" | Select-String $strlocate

#�k�ڂ̕����񂾂������o��
$strSyuku = $strSyuku -Split ","

echo $strSyuku[3].Replace("\'","")