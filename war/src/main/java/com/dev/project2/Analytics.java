package com.dev.project2;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@SuppressWarnings("squid:MethodCyclomaticComplexity")
public class Analytics {
	static List<Proto> mapper;
	static final String PATH;
	static Integer counter;
	static {
		mapper = new ArrayList<>();
		PATH = "/home/cmgroup/REPO/upload/dump.txt";
	}

	public class External {
		public External() {
		}

		public String Elettra; // make this protected or static final sonar # issue
		public Proto[] data;

		public External(String _Elettra, Proto[] _data) {
			this.Elettra = _Elettra;
			this.data = _data;
		}

		public String getElettra() {
			return Elettra;
		}

		public void setElettra(String elettra) {
			this.Elettra = elettra;
		}

		public Proto[] getData() {
			return data;
		}

		public void setData(Proto[] data) {
			this.data = data;
		}

	}

	public class Proto implements Comparable<Proto>, IOrdinableList<Proto> {
		public Proto(String codelettra, String datapubblicazione, String pentester, String alta, String media,
				String bassa, String info, String none, String datareport, String vulnerabilities) {

			this.codelettra = codelettra;
			this.datapubblicazione = datapubblicazione;
			this.pentester = pentester;

			this.alta = alta;
			this.media = media;
			this.bassa = bassa;
			this.info = info;
			this.none = none;

			this.datareport = datareport;
			this.vulnerabilities = vulnerabilities;
		}

		public String codelettra;
		public String datapubblicazione;
		public String pentester;
		public String datareport;
		public String alta;
		public String media;
		public String bassa;
		public String info;
		public String none;
		public String vulnerabilities;

		public String getAlta() {
			return alta;
		}

		public void setAlta(String alta) {
			this.alta = alta;
		}

		public String getMedia() {
			return media;
		}

		public void setMedia(String media) {
			this.media = media;
		}

		public String getBassa() {
			return bassa;
		}

		public void setBassa(String bassa) {
			this.bassa = bassa;
		}

		public String getInfo() {
			return info;
		}

		public void setInfo(String info) {
			this.info = info;
		}

		public String getNone() {
			return none;
		}

		public void setNone(String none) {
			this.none = none;
		}

		public String getCodelettra() {
			return codelettra;
		}

		public void setCodelettra(String codelettra) {
			this.codelettra = codelettra;
		}

		public String getDatapubblicazione() {
			return datapubblicazione;
		}

		public void setDatapubblicazione(String datapubblicazione) {
			this.datapubblicazione = datapubblicazione;
		}

		public String getPentester() {
			return pentester;
		}

		public void setPentester(String pentester) {
			this.pentester = pentester;
		}

		public String getDatareport() {
			return datareport;
		}

		public void setDatareport(String datareport) {
			this.datareport = datareport;
		}

		public String getVulnerabilities() {
			return vulnerabilities;
		}

		public void setVulnerabilities(String vulnerabilities) {
			this.vulnerabilities = vulnerabilities;
		}

		public Proto() {
		}

		@Override
		public int compareTo(Proto o) {

			if (o.codelettra.compareTo(this.codelettra) == 0) {
				return 0;
			} else if (o.codelettra.compareTo(this.codelettra) < 0) {
				return 1;
			} else {
				return -1;
			}
		}
		
		@Override    // # 56.1
		public List<Proto> Ordinatore(List<Proto> t) {

			List<Proto> temp = new ArrayList<>();
			String prevreportdata = "";
			String prevelettra = "";

			for (Proto x : t) {
				String currentreportdata = x.datareport;
				String currentelettra = x.codelettra;
					// rimuove i duplicati   # Debug this dates are not corerctely ordered !!!!
				if (currentreportdata.equals(prevreportdata) && currentelettra.equals(prevelettra)) {
					/* ... */
				} else {
					temp.add(x);
					prevreportdata = currentreportdata;
					prevelettra = currentelettra;
				}
			}
			return temp;
		}
	}
	 /*
	 è possibile creare un solo metodo x serializzare sia T[] che List<T>
	,togliendo i boundaries ...
	 più che altro T x funzionare con objectMapper deve avere il costruttore più
	 tutti i get;set;
     */
	public static <T extends Comparable<T>> String serializerJson(List<T> lista) throws JsonProcessingException {
		ObjectMapper objectmapper = new ObjectMapper();

		return objectmapper.writeValueAsString(lista);
	}

	public static void jsonWriter(String json, String path) {
		try (FileWriter fw = new FileWriter(path, true);

				BufferedWriter bw = new BufferedWriter(fw);

				PrintWriter out = new PrintWriter(bw)) {
			out.println(json);

		} catch (IOException e) {
			/* ... */
		}
	}

	// #2 la classe External non implementa una sega ...
	public static <T> String serializerJson2(List<T> lista) throws JsonProcessingException {
		ObjectMapper objectmapper = new ObjectMapper();

		return objectmapper.writeValueAsString(lista);
	}

	@java.lang.SuppressWarnings({"squid:S3776","findbugs:MethodCyclomaticComplexity"})
	/*
	 * Sopprime il blocker Complessità ciclomatica
	 */
	/* legge il file dump.txt */
	public static void fileReader(String codElettra) {
	
		BufferedReader reader = null;
		
		try {
			File file = new File(PATH);
			reader = new BufferedReader(new FileReader(file));

			String line;
			String str1 = "";
			String str2 = "";
			String str3 = "";

			while ((line = reader.readLine()) != null) {
				if (line.length() > 0) {
					String linecopy = line;
					String line2 = line;

					if (line.contains("ultima Scansione : ")) {
						str1 = linecopy.replaceAll("ultima Scansione : ", "");
						str2 = str1.replaceAll(" by ADLISPA\\\\[a-zA-Z0-9]*", ""); // # Debug this 61 Ldap user may contain special char
						str3 = line.substring(42);
						line2 = reader.readLine();
					}

					String[] _splitted = line2.split(";");
					if (_splitted[1].equals("Non applicabile") || _splitted[1].equals("Non testabile")
							|| _splitted[1].equals("Non Testabile")
							|| _splitted[1].equals("Attivita' non ancora eseguita")
							|| _splitted[1].equals("Attività non ancora eseguita")) {
						/* ... */
					} else {

						String data_temp = _splitted[2].substring(0, 10);
						String anno = data_temp.substring(6, 10);
						String mese = data_temp.substring(3, 5);
						String giorno = data_temp.substring(0, 2);

						String vulenrabilita = _splitted[2];
						Analytics analytics = new Analytics();
						Proto proto = analytics.new Proto();
						proto.datapubblicazione = str2;
						proto.pentester = str3;
						proto.codelettra = _splitted[0];

						proto.datareport = anno + "-" + mese + "-" + giorno;

						proto.alta = (_splitted[1].contains("Alta") ? "High" : "");
						proto.media = (_splitted[1].contains("Media") ? "Medium" : "");
						proto.bassa = (_splitted[1].contains("Bassa") ? "Low" : "");
						proto.info = (_splitted[1].contains("Info") ? "Info" : "");
						proto.none = (_splitted[1].contains("Nessuna") ? "None" : "");

						proto.vulnerabilities = vulenrabilita.substring(11);

						mapper.add(proto);
					}
				}

				counter = mapper.size();

			}

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				reader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}

	}
}
