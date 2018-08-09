using System;
using System.Data.Common;
using System.Collections.Generic;

namespace ExameAbril.DataBase.Generics
{
	public class CType : IType
	{
        private DbTransaction _transaction;
        private bool _isTransaction;
        private bool _isFull;

        /// <summary>
        /// Seta ou Repassa a trasa��o para os outros objetos
        /// </summary>
        public DbTransaction Transaction
        {
            get { return this._transaction; }
            set { this._transaction = value; }
        }
        /// <summary>
        /// Inicia a transa��o no objeto, ao utilizar sempre finalize com Transaction.Commit ou Transaction.Rollback
        /// </summary>
        public bool IsTransaction
        {
            get { return this._isTransaction; }
            set { this._isTransaction = value; }
        }
        /// <summary>
        /// Verifica se o objeto est� preenchido, false: preenche o objeto com os dados da base, true: Utiliza o objeto atual
        /// </summary>
        public bool IsFull
        {
            get { return this._isFull; }
            set { this._isFull = value; }
        }
        /// <summary>
        /// Salva o registro atrav�s de uma refer�ncia do objeto
        /// Ex: usar no ObjectDataSource
        /// </summary>
        /// <param name="objGrupo">objeto grupo</param>
        public static void Save(IType objiType)
        {
            new CData().Save(objiType);
        }
        /// <summary>
        /// Exclui o registro atrav�s de uma refer�ncia do objeto
        /// Ex: usar no ObjectDataSource
        /// </summary>
        /// <param name="objGrupo">objeto grupo</param>
        public static void Delete(IType objiType)
        {
            new CData().Delete(objiType);
        }
        /// <summary>
        /// Retorna lista de grupo filtrando pelo objeto
        /// </summary>
        public static LIType GetByParameters(IType objiType)
        {
            return new CData().Get(objiType);
        }
        /// <summary>
        /// Metodo interno para setar e retorna a referencia
        /// </summary>
        /// <param name="objGrupo">Refer�ncia para o objeto</param>
        protected internal static IType GetByObject(IType objiType)
        {
            return new CData().Get(ref objiType);                
        }
        /// <summary>
        /// Metodo que libera o objeto da mem�ria
        /// </summary>
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
	}
}
