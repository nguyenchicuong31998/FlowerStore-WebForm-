using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// Summary description for SqlDatabase
/// </summary>
namespace QLBH
{
    public static class SqlDatabase
    {
        public static SqlConnection OpenConnectionString()
        {
           return new SqlConnection(WebConfigurationManager.ConnectionStrings["QLBH"].ConnectionString);
        }
        public static DataTable GetData(SqlCommand cmd)
        {
            SqlConnection con = OpenConnectionString();
            cmd.Connection = con;
            using (DataTable dt =new DataTable())
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                    return dt;
                }
            }
                
        }
        public static DataTable GetDataString(string sql)
        {
            SqlConnection con = OpenConnectionString();
            using (DataTable dt = new DataTable())
            {
                using (SqlDataAdapter da = new SqlDataAdapter(sql, con))
                {
                    da.Fill(dt);
                    return dt;
                }
            }

        }
        public static void ExcuteNonQueryCMD(SqlCommand cmd)
        {
            SqlConnection con = OpenConnectionString();
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
        }
        public static void ExcuteNonQueryString(string sql)
        {
            SqlConnection con = OpenConnectionString();
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            cmd.Dispose();// Hủy cmd
            con.Close();
        }
        public static int ExcuteNonQueryTraVeGiaTri(string sql)
        {
            int i = 1;
            {
                SqlConnection con = OpenConnectionString();
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                i = cmd.ExecuteNonQuery();
                con.Close();
            }
            return i;
        }
    }
}