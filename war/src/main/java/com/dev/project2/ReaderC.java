package com.dev.project2;

import java.io.*;

public class ReaderC {

	public Boolean meReader(String path, String stringa) {
		BufferedReader reader = null;

		Integer valuta = 0;

		try {
			File file = new File(path);
			reader = new BufferedReader(new FileReader(file));

			String line;
			while ((line = reader.readLine()) != null) {

				if (line.equals(stringa)) {
					valuta++;
				} else {
					/* ... */
				}

			}

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		return (valuta == 0)?false:true;

	}

	public String meReader(String path) {
		BufferedReader reader = null;

		String oggetto = "," + '"' + "backlog" + '"' + ":[";
		String line;
		String end;

		try {
			File file = new File(path);
			reader = new BufferedReader(new FileReader(file));

			while ((line = reader.readLine()) != null) {

				oggetto += "[" + line + "],";

			}

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		end = oggetto.substring(0, oggetto.length() - 1) + "]}";

		return end;
	}

}
