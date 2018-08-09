using System;
using System.Text;
using System.Data;

namespace Business
{
	public class BsFunctions
	{
		public BsFunctions(){}

		public static bool IsDate( string date )
		{
			try
			{
				DateTime d = Convert.ToDateTime( date );
				return true;
			}
			catch
			{
				return false;
			}
		}

		public static bool IsDouble( string doubles )
		{
			try
			{
				double d = Convert.ToDouble( doubles );
				return true;
			}
			catch
			{
				return false;
			}
		}

		public static string monthToString( int month )
		{
			switch( month )
			{
				case 1:
					return "Janeiro";
				case 2:
					return "Fevereiro";
				case 3:
					return "Marco";
				case 4:
					return "Abril";
				case 5:
					return "Maio";
				case 6:
					return "Junho";
				case 7:
					return "Julho";
				case 8:
					return "Agosto";
				case 9:
					return "Setembro";
				case 10:
					return "Outubro";
				case 11:
					return "Novembro";
				default:
					return "Dezembro";
			}
		}

		public static string NotCarectersNotValid( string s )
		{
			s = s.Replace( "/","" );
			s = s.Replace( "\\","" );
			s = s.Replace( ">","" );
			s = s.Replace( "<","" );
			return s;
		}

		public static string NotAcent( string s )
		{
			s = s.Replace( "�","a" );
			s = s.Replace( "�","a" );
			s = s.Replace( "�","a" );
			s = s.Replace( "�","a" );
			s = s.Replace( "�","e" );
			s = s.Replace( "�","e" );
			s = s.Replace( "�","i" );
			s = s.Replace( "�","o" );
			s = s.Replace( "�","o" );
			s = s.Replace( "�","o" );
			s = s.Replace( "�","u" );
			s = s.Replace( "�","u" );
			s = s.Replace( "�","c" );
			s = s.Replace( "�","A" );
			s = s.Replace( "�","A" );
			s = s.Replace( "�","A" );
			s = s.Replace( "�","A" );
			s = s.Replace( "�","E" );
			s = s.Replace( "�","E" );
			s = s.Replace( "�","I" );
			s = s.Replace( "�","O" );
			s = s.Replace( "�","O" );
			s = s.Replace( "�","O" );
			s = s.Replace( "�","U" );
			s = s.Replace( "�","U" );
			s = s.Replace( "�","C" );

			return s;
		}

		public static int NoFone( string fone )
		{
			fone += "";
			return Convert.ToInt32( "0" + fone.Replace( "-","" ) );
		}
		
		public static int GetIdade( DateTime dateAniver )
		{
			int idate = DateTime.Now.Year - dateAniver.Year;

			if( DateTime.Now < Convert.ToDateTime( dateAniver.Day + "/" + dateAniver.Month + "/" + DateTime.Now.Year ) )
				idate--;

			return idate;
		}

		public static string FormatCpfCnpj( string cpfCnpj )
		{
			cpfCnpj += "";
			if( cpfCnpj.Length == 11 && cpfCnpj.IndexOf( "." ) == -1 )
			{
				string format = cpfCnpj.Substring(0,3) + ".";
				format += cpfCnpj.Substring(3,3) + ".";
				format += cpfCnpj.Substring(6,3) + "-";
				format += cpfCnpj.Substring(9,2);
				return format;
			}
			else if( cpfCnpj.Length == 14 && cpfCnpj.IndexOf( "." ) == -1 )
			{
				string format = cpfCnpj.Substring(0,2) + ".";
				format += cpfCnpj.Substring(2,3) + ".";
				format += cpfCnpj.Substring(5,3) + "/";
				format += cpfCnpj.Substring(8,4) + "-";
				format += cpfCnpj.Substring(12,2);
				return format;
			}


			return "";
		}

		public static string FormatFone( string fone )
		{
			fone += "";
			if( fone.Length == 8 && fone.IndexOf( "-" ) == -1 )
			{
				string format = fone.Substring(0,4) + "-";
				format += fone.Substring(4,4);
				return format;
			}
			return "";
		}

		public static string NotCpfCnpj( string cpfcnpj )
		{
			cpfcnpj += "";
			return cpfcnpj.Replace( ".","" ).Replace( "-","" ).Replace( "/","" );
		}

		public static bool CpfIsValidLen( string cpf )
		{
			cpf = NotCpfCnpj( cpf );
			if( cpf.Length < 11 ) return false;
			else return true;
		}

		public static string FormatCep( string cep )
		{
			cep += "";
			if( cep.Length == 8 && cep.IndexOf( "-" ) == -1 )
			{
				string format = cep.Substring(0,5) + "-";
				format += cep.Substring(5,3);
				return format;
			}
			return "";
		}

		public static string NoCep( string cep )
		{
			cep += "";
			return cep.Replace( "-","" );
		}
	}
}
