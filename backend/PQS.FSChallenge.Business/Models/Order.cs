#nullable disable
namespace PQS.FSChallenge.Business.Models
{
    public class Order
    {
        public Order()
        {
            OrderItems = new HashSet<OrderItem>();
        }

        public int OrderId { get; set; }
        public OrderStatus Status { get; set; }
        public string OrderDescription { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime? AuthDate { get; set; }       

        public virtual ICollection<OrderItem> OrderItems { get; set; }
    }

   
}