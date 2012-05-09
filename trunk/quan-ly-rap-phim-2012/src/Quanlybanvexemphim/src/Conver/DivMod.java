package Conver;

import java.util.ArrayList;

public class DivMod {
	public int LayGio(int gioKT, int phutKT){
		float kq;
		kq=phutKT/60;
		if(kq>=1){
			gioKT += kq;
			phutKT=phutKT%60;
			System.out.println("gio======"+gioKT);
			System.out.println("phut======"+phutKT);
			return gioKT;
			
		}
		return gioKT;
	}
	public int LayPhut(int gioKT, int phutKT) {
		int kq;
		kq=phutKT%60;
		return kq;
		
	}
	public ArrayList<Integer> LayGioArray(int gioKT, int phutKT){
		ArrayList<Integer> gioPhutAr=new ArrayList<Integer>();
		
		float kq;
		kq=phutKT/60;
		if(kq>=1){
			gioKT += kq;
			phutKT=phutKT%60;
			System.out.println("gio======"+gioKT);
			System.out.println("phut======"+phutKT);
			gioPhutAr.add(gioKT);
			gioPhutAr.add(phutKT);
			return gioPhutAr;
			
		}else {
			gioPhutAr.add(gioKT);
			gioPhutAr.add(phutKT);
			return gioPhutAr;

		}
		
	}
	/*public ArrayList<Integer> GioPhut(int gioKT, int phutKT){
		ArrayList<Integer> gioPhutList=null;
		float kqGio;
		int kqPhut;
		kqPhut=phutKT%60;
		kqGio=phutKT/60;		
		if(kqGio>=1){
			gioKT += kqGio;
			phutKT=kqPhut;
			gioPhutList.add(gioKT);
			gioPhutList.add(phutKT);
			
		}else{
			gioPhutList.add(gioKT);
			gioPhutList.add(phutKT);
		}
		return gioPhutList;
	}*/
	public static void main(String[] args){
		DivMod d=new DivMod();
	
		//System.out.println("gio======="+d.LayGio(2,70));
		//System.out.println("phut========"+d.LayPhut(2, 70));
		ArrayList<Integer> gpAr=new ArrayList<Integer>();
		gpAr=d.LayGioArray(2, 50);
		System.out.println("========"+gpAr);
	
		}

}
