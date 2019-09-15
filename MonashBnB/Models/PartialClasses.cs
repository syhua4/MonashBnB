using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MonashBnB.Models
{
    [MetadataType(typeof(UserMetadata))]
    public partial class User
    {
        public string confirmPassword { get; set; }
    }
}