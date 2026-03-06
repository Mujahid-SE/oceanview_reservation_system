package com.oceanview.reservation_system.test;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

import com.oceanview.reservation_system.model.Reservation;

public class ReservationTest {

    @Test
    public void testReservationName() {

        Reservation reservation = new Reservation();
        reservation.setGuestName("Ahmed");

        assertEquals("Ahmed", reservation.getGuestName());
    }

    @Test
    public void testRoomType() {

        Reservation reservation = new Reservation();
        reservation.setRoomType("Deluxe");

        assertEquals("Deluxe", reservation.getRoomType());
    }
}