package com.vanda.domain;

public class PetInfoVO {

   private String pet_name;
   private double eat_gram;
   private double pet_weight;
   private double total_distance; 
   private String timer;

   public PetInfoVO() {
   }

   public PetInfoVO(String pet_name,double eat_gram, double pet_weight, double total_distance, String timer) {
      this.pet_name=pet_name;
      this.eat_gram = eat_gram;
      this.pet_weight = pet_weight;
      this.total_distance = total_distance;
      this.timer = timer;
   }

   public double getTotal_distance() {
      return total_distance;
   }

   public void setTotal_distance(double total_distance) {
      this.total_distance = total_distance;
   }

   public String getTimer() {
      return timer;
   }

   public void setTimer(String timer) {
      this.timer = timer;
   }

   public double getEat_gram() {
      return eat_gram;
   }

   public void setEat_gram(double eat_gram) {
      this.eat_gram = eat_gram;
   }

   public double getPet_weight() {
      return pet_weight;
   }

   public void setPet_weight(double pet_weight) {
      this.pet_weight = pet_weight;
   }

   public String getPet_name() {
      return pet_name;
   }

   public void setPet_name(String pet_name) {
      this.pet_name = pet_name;
   }

}