#縮尺の文字列が記録されている位置の座標をセットする
$strlocate = "'341.750000','230.750000'"

#SXFファイルから縮尺の文字列が記録された行を取り出す
$strSyuku = Get-Content $ARGS[0] | Select-String "text_string_feature" | Select-String $strlocate

#縮尺の文字列だけを取り出す
$strSyuku = $strSyuku -Split ","

echo $strSyuku[3].Replace("\'","")