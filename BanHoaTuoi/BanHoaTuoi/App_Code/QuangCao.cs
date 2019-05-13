using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using QLBH;
/// <summary>
/// Summary description for QuangCao
/// </summary>
///
public static class QuangCao
{
    #region Load anh của website ban hoa
    /// <summary>
    /// Gồm hai tham số Thứ tự ảnh và Trạng Thái
    /// </summary>
    /// <param name="ThuTu"></param>
    /// <param name="TrangThai"></param>
    /// <returns></returns>
    public static DataTable GetPicture(int ThuTu,int TrangThai)
    {
        SqlConnection con = SqlDatabase.OpenConnectionString();
        SqlCommand cmd = new SqlCommand("ANHQC",con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@THUTUQC",SqlDbType.Int).Value=ThuTu;
        cmd.Parameters.Add("@TRANGTHAI", SqlDbType.Int).Value = Convert.ToInt16(TrangThai);
        return SqlDatabase.GetData(cmd);
    }
    #endregion
    #region ss

    #endregion
}