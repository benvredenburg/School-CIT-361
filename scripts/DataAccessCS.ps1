$csb=[System.Data.Odbc.OdbcConnectionStringBuilder]::new()
$csb.Driver='Microsoft Access Driver (*.mdb)'
$csb.add('dbq', 'C:\Users\benvr\psfiles\data\gems.mdb')
$da=[System.Data.Odbc.OdbcDataAdapter]::new('select * from gem',$csb.ConnectionString)
$ds=[System.Data.DataSet]::new($da)
$da.Fill($ds)
$ds.Tables[0]|ft