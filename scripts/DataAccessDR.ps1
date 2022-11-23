$csb=[System.Data.Odbc.OdbcConnectionStringBuilder]::new()
$csb.Driver='Microsoft Access Driver (*.mdb)'
$csb.add('dbq', 'C:\Users\benvr\psfiles\data\gems.mdb')
$con=[System.Data.Odbc.OdbcConnection]::new($csb.ConnectionString)
$cmd=[System.Data.Odbc.OdbcCommand]::new('select * from gem', $con)
$con.Open()
$reader=$cmd.ExecuteReader()

While ($reader.Read()) {
    Write-Host $reader['Mineral'] $reader['hardness']
}
$reader.Close()
$con.Close()