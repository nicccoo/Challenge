#nullable disable
using Microsoft.EntityFrameworkCore;

namespace PQS.FSChallenge.Business.Models
{
    public partial class FSChallengeContext : DbContext
    {
        public FSChallengeContext()
        {
        }

        public FSChallengeContext(DbContextOptions<FSChallengeContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<OrderItem> OrderItems { get; set; }
        public virtual DbSet<OrderInfo> OrderInfo { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Order>(entity =>
            {
                entity.HasIndex(e => e.Status, "IX_ORDER_Status");

                entity.Property(e => e.AuthDate).HasColumnType("datetime");

                entity.Property(e => e.CreatedOn)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.OrderDescription)
                    .IsRequired()
                    .HasMaxLength(255);
            });

            modelBuilder.Entity<OrderItem>(entity =>
            {
                entity.HasKey(e => e.OrderItemId)
                    .HasName("PK_ORDER_ITEMS")
                    .IsClustered(false);

                entity.ToTable("Order_Items");

                entity.HasIndex(e => e.OrderId, "IX_ORDER_ITEMS_OrderId")
                    .IsClustered();

                entity.Property(e => e.ItemDescription)
                    .IsRequired()
                    .HasMaxLength(255);

                entity.Property(e => e.UnitPrice).HasColumnType("numeric(32, 2)");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.OrderItems)
                    .HasForeignKey(d => d.OrderId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ORDER_ITEMS_ORDERS");
            });

            modelBuilder.Entity<OrderInfo>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("vOrders_Info");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.OrderDescription)
                    .IsRequired()
                    .HasMaxLength(255);

                entity.Property(e => e.Qitems).HasColumnName("QItems");

                entity.Property(e => e.Total).HasColumnType("numeric(38, 2)");

                entity.Property(e => e.UnitPrice).HasColumnType("numeric(32, 2)");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}