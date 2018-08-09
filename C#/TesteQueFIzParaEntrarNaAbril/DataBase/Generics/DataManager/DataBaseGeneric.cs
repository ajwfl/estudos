using System.Data.Common;
using System.Data.OleDb;
using System.Data.SqlClient;

namespace ExameAbril.DataBase.Generics.DataManager
{
    /// <summary>
    /// class de Gerenciamento de Objetos de Conex�o
    /// </summary>
    public class DataBaseGeneric
    {
        private DataBaseGeneric() { }
        /// <summary>
        /// Retorna um Objeto gen�rico de Conex�o
        /// </summary>
        /// <param name="type">Tipo de Banco de Dados a ser usado</param>
        /// <param name="connectionString">String de Conex�o para acesso ao Banco de Dados</param>
        public static DbConnection CreateConnection(DataBaseType type, string connectionString)
        {
            switch(type)
            {
                case DataBaseType.SqlServer:
                return new SqlConnection(connectionString);

                case DataBaseType.MsAccess:
                return new OleDbConnection(connectionString);
            }
            return null;
        }

        /// <summary>
        /// Retorna um Objeto gen�rico de Comando
        /// </summary>
        /// <param name="type">Tipo de Banco de Dados a ser usado</param>
        public static DbCommand CreateCommand(DataBaseType type)
        {
            switch (type)
            {
                case DataBaseType.SqlServer:
                    return new SqlCommand();

                case DataBaseType.MsAccess:
                    return new OleDbCommand();
            }
            return null;
        }
    }
}
