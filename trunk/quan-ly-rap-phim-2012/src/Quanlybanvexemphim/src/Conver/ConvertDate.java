package Conver;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;


/**
 * @author Admin
 * 
 */
public class ConvertDate {
    public Date convertDateSqlToDateJava(java.sql.Date sqlDate) {

        // this is the conversion
        Date utilDate = new java.util.Date(sqlDate.getTime());

        return utilDate;
    }

    /*
     * Chuyen ngay java sang String
     * 
     * @param dateJava
     * 
     * @return String
     */

    public String convertDateJavaToString(Date dateJava) {
        DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm");
        String reportDate = df.format(dateJava);
        return reportDate;
    }

    /*
     * Chuyen ngay Java sang kieu String co dinh dang MMdd
     * 
     * @param dateJava
     * 
     * @return String
     */
    public String convertDateJavaToStringMMdd(Date dateJava) {
        DateFormat df = new SimpleDateFormat("MM/dd");
        String reportDate = df.format(dateJava);
        return reportDate;
    }

    /*
     * Chuyen doi ngay SQL sang String
     * 
     * @param dateSQL
     * 
     * @return String
     */
    public String convertDateSqlToString(java.sql.Date dateSQL) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
        String dateString = dateFormat.format(dateSQL);
        return dateString;

    }

    /*
     * Chuyen doi tu String sang DateJava
     * 
     * @param strDate
     * 
     * @return
     * 
     * @throws ParseException
     */
    public Date convertStringToDateJava(String strDate) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
        return dateFormat.parse(strDate);
    }

    /*
     * So sanh mot ngay Sql voi ngay he thong
     * 
     * @param dateSQL
     * 
     * @return
     */
    public boolean compareDateSQlWithDateCurent(java.sql.Date dateSQL) {
        Calendar ngayHienTai = Calendar.getInstance();
        Date date = new Date(dateSQL.getTime());
        Calendar ngaySQLcal = Calendar.getInstance();
        ngaySQLcal.setTime(date);
        return (ngayHienTai.compareTo(ngaySQLcal) >= 0);

    }

    /*
     * Lay danh sach cac ngay nam trong khoang {startDate,endDate}
     * 
     * @param startDate
     * 
     * @param endDate
     * 
     * @return ArrayList<String>
     */
  /*  public ArrayList<String> getDatesInDuration(String startDate, String endDate) {
        ArrayList<String> dayOfMonthList = null;
        try {
            Date startUtilDate = convertStringToDateJava(startDate);
            Date endUtilDate = convertStringToDateJava(endDate);

            Calendar currentIndexCalendar = Calendar.getInstance();
            currentIndexCalendar.setTime(startUtilDate);

            Calendar endCalendar = Calendar.getInstance();
            endCalendar.setTime(endUtilDate);
            dayOfMonthList = new ArrayList<String>();
            while (currentIndexCalendar.compareTo(endCalendar) <= 0) {
                currentIndexCalendar.add(Calendar.DAY_OF_MONTH, 1);
                if (Integer.valueOf(currentIndexCalendar
                        .get(Calendar.DAY_OF_MONTH)) < 10) {
                    dayOfMonthList.add("0"
                            + Integer.valueOf(
                                    currentIndexCalendar
                                            .get(Calendar.DAY_OF_MONTH))
                                    .toString());
                } else {
                    dayOfMonthList.add(Integer.valueOf(
                            currentIndexCalendar.get(Calendar.DAY_OF_MONTH))
                            .toString());
                }

            }
        } catch (ParseException e) {

            e.printStackTrace();
        }
        return dayOfMonthList;
    }*/
    /*su dung cho trang Lichchieu
     * Lay danh sach cac ngay nam trong khoang {startDate,endDate}
     * 
     * @param startDate
     * 
     * @param endDate
     * 
     * @return ArrayList<String>
     */
 /*   public ArrayList<String> getDatesInDuration(String startDate, String endDate) {
        ArrayList<String> dayOfMonthList = null;
        try {
            Date startUtilDate = convertStringToDateJava(startDate);
            Date endUtilDate = convertStringToDateJava(endDate);

            Calendar currentIndexCalendar = Calendar.getInstance();
            currentIndexCalendar.setTime(startUtilDate);
            

            Calendar endCalendar = Calendar.getInstance();
            endCalendar.setTime(endUtilDate);
            dayOfMonthList = new ArrayList<String>();
            while (currentIndexCalendar.compareTo(endCalendar) <= 0) {
          //  while(currentIndexCalendar.before(endCalendar))
            
                
                if (Integer.valueOf(currentIndexCalendar
                        .get(Calendar.DAY_OF_MONTH)) < 10) {
                    dayOfMonthList.add("0"
                            + Integer.valueOf(
                                    currentIndexCalendar
                                            .get(Calendar.DAY_OF_MONTH))
                                    .toString()+"/"+ Integer.valueOf(
                                    currentIndexCalendar
                                            .get(Calendar.MONTH)+1)
                                    .toString()+"/"+ Integer.valueOf(
                                    currentIndexCalendar
                                            .get(Calendar.YEAR))
                                    .toString());
                } else {
                	//System.out.println("neu ngay lon hon 10");
                    dayOfMonthList.add(Integer.valueOf(
                            currentIndexCalendar.get(Calendar.DAY_OF_MONTH))
                            .toString()+"/"+ Integer.valueOf(
                                    currentIndexCalendar
                                    .get(Calendar.MONTH)+1)
                            .toString()+"/"+ Integer.valueOf(
                            currentIndexCalendar
                                    .get(Calendar.YEAR))
                            .toString());
                }
                currentIndexCalendar.add(Calendar.DAY_OF_MONTH, 1);

            }
        } catch (ParseException e) {

            e.printStackTrace();
        }
        return dayOfMonthList;
    }*/
    public ArrayList<String> getDatesInDuration(String startDate, String endDate) {
        ArrayList<String> dayOfMonthList = null;
        try {
            Date startUtilDate = convertStringToDateJava(startDate);
            Date endUtilDate = convertStringToDateJava(endDate);

            Calendar currentIndexCalendar = Calendar.getInstance();
            currentIndexCalendar.setTime(startUtilDate);
            

            Calendar endCalendar = Calendar.getInstance();
            endCalendar.setTime(endUtilDate);
            dayOfMonthList = new ArrayList<String>();
            while (currentIndexCalendar.compareTo(endCalendar) <= 0) {
          //  while(currentIndexCalendar.before(endCalendar))
            
                
                if (Integer.valueOf(currentIndexCalendar
                        .get(Calendar.DAY_OF_MONTH)) < 10) {
                    dayOfMonthList.add(Integer.valueOf(
                            currentIndexCalendar
                            .get(Calendar.MONTH)+1)
                    .toString()+"/"+"0"
                            + Integer.valueOf(
                                    currentIndexCalendar
                                            .get(Calendar.DAY_OF_MONTH))
                                    .toString()+"/"+  Integer.valueOf(
                                    currentIndexCalendar
                                            .get(Calendar.YEAR))
                                    .toString());
                } else {
                	//System.out.println("neu ngay lon hon 10");
                    dayOfMonthList.add(Integer.valueOf(
                            currentIndexCalendar
                            .get(Calendar.MONTH)+1)
                    .toString()+"/"+Integer.valueOf(
                            currentIndexCalendar.get(Calendar.DAY_OF_MONTH))
                            .toString()+"/"+  Integer.valueOf(
                            currentIndexCalendar
                                    .get(Calendar.YEAR))
                            .toString());
                }
                currentIndexCalendar.add(Calendar.DAY_OF_MONTH, 1);

            }
        } catch (ParseException e) {

            e.printStackTrace();
        }
        return dayOfMonthList;
    }


    
    /*
     * Kiem tra mot ngay co nam trong khoang < ngay ket thuc và > ngay bat dau
     * khong?
     * 
     * @param startDate
     * 
     * @param endDate
     * 
     * @param dateCompare
     * 
     * @return boolean
     */
    public boolean contractIsExistInDuration(Date startDate, Date endDate,
            Calendar dateCompare) {
        Calendar dateStartCal = Calendar.getInstance();
        dateStartCal.setTime(startDate);
        Calendar dateEndCal = Calendar.getInstance();
        dateEndCal.setTime(endDate);
        return ((dateCompare.compareTo(dateStartCal) >= 0) && (dateCompare
                .compareTo(dateEndCal) <= 0));

    }

    /*
     * Lay ngay he thong
     * 
     * @return Calendar
     */
    public Calendar layNgayHeThong() {
        return Calendar.getInstance();
    }

    /*
     * Lay ngay truoc ngay hien tai 2 thang
     * 
     * @return Calendar
     */
    public Calendar layNgayTruocHienTaiHaiThang() {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, -2);
        return cal;
    }

    /*
     * Convert 1 ngay tu kieu Calendar sang DateJava
     * 
     * @param cal
     * 
     * @return
     * 
     * @throws ParseException
     */
    public Date convertCalDateTOJavaDate(Calendar cal) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
        String dateString = dateFormat.format(cal.getTime());
        return convertStringToDateJava(dateString);
    }

    /*
     * Lay thu cua ngay
     * 
     * @param dateCAL
     * 
     * @return
     * 
     * @throws ParseException
     */
    public String layThuCuaNgay(Calendar dateCAL) throws ParseException {
        Date dateJava = convertCalDateTOJavaDate(dateCAL);

        String day1 = null;

        DateFormat f = new SimpleDateFormat("EEEE");

        day1 = f.format(dateJava);

        return day1;
    }

//    /*
//     * Ham lay ArrayList<GroupDateInfo> gom chuoi "ngay bat dau +ngay ket thuc"
//     * cua 1 tuan cung so bien dem so Span
//     * 
//     * @return ArrayList<GroupDateInfo>
//     * 
//     * @throws ParseException
//     */
//    public ArrayList<GroupDateInfo> getGroupDate() throws ParseException {
//        ArrayList<GroupDateInfo> listGroupDate = new ArrayList<GroupDateInfo>();
//        Calendar dateSttart = layNgayTruocHienTaiHaiThang();
//        Calendar dateEnd = layNgayHeThong();
//        String ketqua = null;
//        GroupDateInfo groupDateInfo = null;
//        int dem = 0;
//        int tongso = 0;
//        while (dateSttart.compareTo(dateEnd) <= 0) {
//            groupDateInfo = new GroupDateInfo();
//
//            tongso++;
//
//            if ("Monday".equals(layThuCuaNgay(dateSttart))) {
//                dem = 1;
//                ketqua = convertDateJavaToStringMMdd(convertCalDateTOJavaDate(dateSttart))
//                        + "-";
//
//            } else if ("Sunday".equals(layThuCuaNgay(dateSttart))) {
//                dem++;
//                if (ketqua != null) {
//                    ketqua = ketqua
//                            + convertDateJavaToString(convertCalDateTOJavaDate(dateSttart));
//                } else {
//                    ketqua = convertDateJavaToStringMMdd(convertCalDateTOJavaDate(dateSttart));
//                }
//                // Set vao Bean
//                groupDateInfo.setChuoiHienthi(ketqua);
//                groupDateInfo.setNumberSpan(dem);
//                listGroupDate.add(groupDateInfo);
//            } else if (tongso == 1) {
//
//                dem = 1;
//                ketqua = convertDateJavaToStringMMdd(convertCalDateTOJavaDate(dateSttart))
//                        + "-";    
//            } else {
//                dem++;
//            }
//
//            dateSttart.add(Calendar.DAY_OF_MONTH, 1);
//        }
//
//        if (("Monday".equals(layThuCuaNgay(dateEnd)))
//                || ("Tuesday".equals(layThuCuaNgay(dateEnd)))) {
//            ketqua = convertDateJavaToStringMMdd(convertCalDateTOJavaDate(dateEnd));
//        } else  if (!"Sunday".equals(layThuCuaNgay(dateEnd))){
//            ketqua = ketqua
//                    + convertDateJavaToString(convertCalDateTOJavaDate(dateEnd));
//          
//        }
//        
//
//        // Set vao Bean
//        groupDateInfo.setChuoiHienthi(ketqua);
//        groupDateInfo.setNumberSpan(dem);
//        listGroupDate.add(groupDateInfo);
//        // Return listGroupDate
//        return listGroupDate;
//    }
    
    
    /*
     * Dem so ngay trong mot khoang thoi gian nao do
     * 
     * @param startDate
     * 
     * @param endDate
     * 
     * @return ArrayList<String>
     */
    public int getNumberOfDate(String startDate, String endDate) {
        int soNgay = 0;
        try {
            Date startUtilDate = convertStringToDateJava(startDate);
            Date endUtilDate = convertStringToDateJava(endDate);

            Calendar startCalendar = Calendar.getInstance();
            startCalendar.setTime(startUtilDate);

            Calendar endCalendar = Calendar.getInstance();
            endCalendar.setTime(endUtilDate);
            
            while (startCalendar.before(endCalendar)) {
            	soNgay ++;
            	startCalendar.add(Calendar.DATE, 1);
            	//startCalendar.add(Calendar.HOUR_OF_DAY, 24);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return soNgay;
    }
    //SO SANH NGAY NHAP VAO CO LON HON NGAY HIEN TAI HAY KO?
   /* public boolean checkDate(String date1)
    {
    	try {
    		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    		sdf.setLenient(false);
    		//Date date1 = new (sdf.parse(gDate).getTime());
    		Date date = new Date(sdf.parse(date1).getTime());

    		//kiem tra xem co lo'n hon ngay hien tai khong?
    		Date now=new Date(System.currentTimeMillis());
    		
    		System.out.println("ngay hien tai la:"+now);
    		System.out.println("ngay nhap vao la:======="+date);
    		if(date.compareTo(now)>0){
    			System.out.println("ngay he thong nho hon ngay:<<<<<<<<<<"+date);
    			return true;
    		}else{
    			System.out.println("ngay he thong lon hon ngay:>>>>>>>>>>>>"+date);
    			return false;
    		}
    	} catch (ParseException ex) {
    		return false;
    	}

    } */
    public int checkDate(String date1)
    {    	
    	try {
    		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
    		sdf.setLenient(false);
    		//Date date1 = new (sdf.parse(gDate).getTime());
    		Date date = new Date(sdf.parse(date1).getTime());

    		//kiem tra xem co lo'n hon ngay hien tai khong?
    		Date now=new Date(System.currentTimeMillis());
    		
    		System.out.println("ngay hien tai la:"+now);
    		System.out.println("ngay nhap vao la:======="+date);
    		if(date.compareTo(now)>0){
    			System.out.println("ngay he thong nho hon ngay:<<<<<<<<<<"+date);
    			return 1;
    		}else{
    			System.out.println("ngay he thong lon hon ngay:>>>>>>>>>>>>"+date);
    			return 0;
    		}
    	} catch (ParseException ex) {
    		return 0;
    	}

    } 
    public int checkDateLich(String date1)
    {    	
    	try {
    		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
    		sdf.setLenient(false);
    		//Date date1 = new (sdf.parse(gDate).getTime());
    		Date date = new Date(sdf.parse(date1).getTime());

    		//kiem tra xem co lo'n hon ngay hien tai khong?
    		Date now=new Date(System.currentTimeMillis());
    		
    		System.out.println("ngay hien tai la:"+now);
    		System.out.println("ngay nhap vao la:======="+date);
    		if(date.compareTo(now)>0){
    			System.out.println("ngay hien tai nho hon ngay:<<<<<<<<<<"+date);
    			return 1;
    		}else{
    			System.out.println("ngay hien tai lon hon ngay:>>>>>>>>>>>>"+date);
    			return 0;
    		}
    	} catch (ParseException ex) {
    		return 0;
    	}

    } 

        
    public static void main(String[] args) {
    	ConvertDate cd = new ConvertDate();
    	//System.out.println("SO ngay ===" + cd.getNumberOfDate("2011/01/01 10:10", "2011/01/03 10:10"));
    	//System.out.println("SO ngay ===" + cd.getDatesInDuration("2012/01/01 00:00","2012/02/10 00:00"));
    	System.out.println(cd.checkDateLich("04/25/2012"));
    	
     
	}
}
