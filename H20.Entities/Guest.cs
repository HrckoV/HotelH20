using System;
using System.ComponentModel.DataAnnotations;

namespace H20.Entities
{
    public class Guest
    {

        public int Guest_ID;

        [Required (ErrorMessage="Morate unijeti korisničko ime!")]
        [Display(Name = "Korisničko ime:")]
        public string Guest_Username { get; set; }

        [Required(ErrorMessage = "Morate unijeti lozinku!")]
        [DataType(DataType.Password)]
        [StringLength(15, MinimumLength = 6)]
        [Display(Name = "Lozinka:")]
        public string Guest_Password { get; set; }

        

    }

}
