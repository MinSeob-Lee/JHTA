package data.service;

import java.util.List;
import java.util.Map;
import java.util.NavigableSet;
import java.util.TreeMap;

import data.repo.DataRepo;
import data.vo.Data;

public class DataService {

	private DataRepo repo;

	public DataService() throws Exception {
		repo = new DataRepo();
	}

	// 전체 사고건수를 출력하는 기능
	public void printAllDataCount() {
		List<Data> datas = repo.getAllData();

		int totalDeath = 0;
		for (Data data : datas) {
			totalDeath += data.getDeath();
		}
		System.out.println("전체 사고건수 : " + datas.size());
		System.out.println("전체 사망자수 : " + totalDeath);
	}

	// 시도를 전달받아서 해당 지역의 사고건수를 출력하는 기능
	public void printDataBySido(String sido) {
		List<Data> datas = repo.getDataBySido(sido);

		int totalDeath = 0;
		for (Data data : datas) {
			totalDeath += data.getDeath();
		}
		System.out.println("[" + sido + "] 지역 사고 현황");
		System.out.println("전체 사고건수 : " + datas.size());
		System.out.println("전체 사망자수 : " + totalDeath);
	}

	// 날짜를 전달받아서 해당 날짜의 사고건수로 사망자 수를 출력하는 기능
	public void printDataByDay(String day) {
		List<Data> datas = repo.getDataByDay(day);

		int totalDeath = 0;
		for (Data data : datas) {
			totalDeath += data.getDeath();
		}
		System.out.println("[" + day + "] 날짜 사고 현황");
		System.out.println("전체 사고건수 : " + datas.size());
		System.out.println("전체 사망자수 : " + totalDeath);
	}

	// 시도를 전달받아서 해당 지역의 구군별 사고현황 통계를 출력하는 기능
	public void printDataStatBySido(String sido) {
		List<Data> datas = repo.getDataBySido(sido);

		TreeMap<String, Stat> map = new TreeMap<String, Stat>();

		for (Data data : datas) {
			String gugun = data.getGugun();
			int death = data.getDeath();

			if (map.containsKey(gugun)) {
				Stat stat = map.get(gugun);
				stat.setRecords(stat.getRecords() + 1);
				stat.setDeaths(stat.getDeaths() + death);
			} else {
				Stat stat = new Stat();
				stat.setRecords(1);
				stat.setDeaths(death);

				map.put(gugun, stat);
			}
		}

		NavigableSet<String> set = map.navigableKeySet();
		System.out.println("[구군] 사고건수 사망자수");
		for (String key : set) {
			Stat stat = map.get(key);
			System.out.println("[" + key + "]" + stat.getRecords() + " " + stat.getDeaths());
		}
	}

	// 월별 사고현황 통계를 출력하는 기능
	public void printDataStatByMonth() {

	}

	// 요일별 사고현황 통계를 출력하는 기능
	public void printDataStatByDayOfWeek() {

	}

	// 사고현황 요약 결과를 출력하는 기능
	public void printDataStat() {

	}

	class Stat {
		private int records;
		private int deaths;

		public Stat() {
		}

		public int getRecords() {
			return records;
		}

		public void setRecords(int records) {
			this.records = records;
		}

		public int getDeaths() {
			return deaths;
		}

		public void setDeaths(int deaths) {
			this.deaths = deaths;
		}

	}
}
