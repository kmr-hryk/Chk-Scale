#初期値のセット
#CADの縦横の縮尺が同じ場合にのみ計算ができます。

#縮尺の文字列が記録されている位置の座標をセットする
$strlocate = "'341.750000','230.750000'"
#取得したいCAD座標系の名称をセットする
$strLayer = "測量図"


#処理の開始
$filename = $ARGS[0]

#SXFファイルから縮尺の文字列が記録された行を取り出す
$strSyuku = Get-Content $filename | Select-String "text_string_feature" | Select-String $strlocate

#縮尺の文字列だけを取り出す
$strSyuku = $strSyuku -Split ","
$strSyuku = $strSyuku[3].Replace("\'","")

#SXFファイルからCAD座標系の縮尺が記録された行を取り出す
$mathSyuku = Get-Content $filename | Select-String "sfig_locate_feature" | Select-String $strLayer

#縮尺を計算する
$mathSyuku = $mathSyuku -Split ","
$mathSyuku = $mathSyuku[5].Replace("'","")
$mathSyuku = [int][math]::Pow([double]$mathSyuku,-1)

if ($strSyuku -eq $mathSyuku) {
   Write-Output "正しい縮尺が記録されています`nFilename:$filename`nScale:1/$mathSyuku"
}else{
   Write-Output "縮尺が異なっています`nFilename:$filename`nPaper:1/$strSyuku`nCal:1/$mathSyuku"
}