using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace MonashBnB.Models
{
    public class UserMetadata
    {
        [Display(Name="Email")]
        [Required(ErrorMessage = "This Field is Required")]
        public string userEmail { get; set; }


        [Display(Name = "Admin")]
        public bool userType { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        [Required(ErrorMessage = "This Field is Required")]
        public string userPassword { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm Password")]
        [Compare("userPassword")]
        public string confirmPassword { get; set; }
    }
}