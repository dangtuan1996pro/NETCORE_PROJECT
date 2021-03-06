﻿using OrderService.Domain.Entities;
using OrderService.Domain.ReadModels;
using System;
using System.Collections.Generic;
using System.Text;

namespace OrderService.Application.Response
{
    public class UpdateInvoiceResponse : BaseResponse
    {
        public bool OK { get; set; }
        public string Content { get; set; }
    }
}
