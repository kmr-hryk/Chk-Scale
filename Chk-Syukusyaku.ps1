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
$calSyuku = Get-Content $filename | Select-String "sfig_locate_feature" | Select-String $strLayer

#縮尺を計算する
$calSyuku = $calSyuku -Split ","
$calSyuku = $calSyuku[5].Replace("'","")
$calSyuku = [int][math]::Pow([double]$calSyuku,-1)

#縮尺を比較する
if ($strSyuku -eq $calSyuku) {
   Write-Output "Match.`nFilename:$filename`nScale:1/$calSyuku"
}else{
   $tmpColor = (Get-Host).UI.RawUI.ForegroundColor
   (Get-Host).UI.RawUI.ForegroundColor = "Red"
   Write-Output "Unmath.`nFilename:$filename`nPaper:1/$strSyuku`nCal:1/$calSyuku"
   (Get-Host).UI.RawUI.ForegroundColor = $tmpColor
}