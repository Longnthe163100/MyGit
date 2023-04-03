package model;

public class Room {

    private int room_id;
    private int house_id;
    private int room_number;
    private String cus_name;
    private String cus_email;
    private int cus_phone;
    private boolean status;

    public Room() {
    }

    public Room(int room_id, int house_id, int room_number, String cus_name, String cus_email, int cus_phone, boolean status) {
        this.room_id = room_id;
        this.house_id = house_id;
        this.room_number = room_number;
        this.cus_name = cus_name;
        this.cus_email = cus_email;
        this.cus_phone = cus_phone;
        this.status = status;
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public int getHouse_id() {
        return house_id;
    }

    public void setHouse_id(int house_id) {
        this.house_id = house_id;
    }

    public int getRoom_number() {
        return room_number;
    }

    public void setRoom_number(int room_number) {
        this.room_number = room_number;
    }

    public String getCus_name() {
        return cus_name;
    }

    public void setCus_name(String cus_name) {
        this.cus_name = cus_name;
    }

    public String getCus_email() {
        return cus_email;
    }

    public void setCus_email(String cus_email) {
        this.cus_email = cus_email;
    }

    public int getCus_phone() {
        return cus_phone;
    }

    public void setCus_phone(int cus_phone) {
        this.cus_phone = cus_phone;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}
