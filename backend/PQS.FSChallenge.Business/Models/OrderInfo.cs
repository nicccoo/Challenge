﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace PQS.FSChallenge.Business.Models
{
    public class OrderInfo
    {
        public int OrderId { get; set; }
        public OrderStatus Status { get; set; }
        public string OrderDescription { get; set; }
        public DateTime CreatedOn { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal? Total { get; set; }
        public int? Qitems { get; set; }
    }
}