//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MonashBnB.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Room
    {
        public int roomId { get; set; }
        public int roomTypeId { get; set; }
        public double roomPricePerNight { get; set; }
        public short roomAvailability { get; set; }
        public int HotelId { get; set; }
    
        public virtual Hotel Hotel { get; set; }
        public virtual RoomType RoomType { get; set; }
    }
}