require 'rails_helper'

RSpec.describe Customer, type: :model do

  #let(:customer) {create(:customer)}


   describe 'checking the validations and presence of customer attributes' do

     let(:customer_attributes) {attributes_for(:customer)}
     subject(:customer_valid) {Customer.new(customer_attributes).valid?}

     context 'with first_name not provided' do
       it 'should return false' do
         customer_attributes[:first_name] = nil
         expect(customer_valid).to be false
       end
     end

     context 'with mobile number not provided' do
       it 'should return false' do
         customer_attributes[:mobile] = nil
         expect(customer_valid).to be false
       end
     end

     context 'when no email id provided' do
       it 'should add the default value' do
         customer_attributes[:email] = nil
         @customer = Customer.create! customer_attributes
         expect(@customer).to receive(:set_defaults).with(no_args)
         @customer.set_defaults
         expect(@customer.email).to eql 'Not Available'
       end
     end

     context 'email and mobile should be unique' do
       it 'should check uniqueness mobile' do
         customer_attributes[:email] = 'trial'
         create(:customer)
         expect(customer_valid).to be false
       end
       it 'should check uniqueness of email' do
         customer_attributes[:mobile] = 'trial'
         customer_attributes[:email] = 'yp@gmail.com'
         create(:customer)
         expect(customer_valid).to be false
       end
     end

     context 'name method return the first name' do
       it 'should return first name' do
         @customer = create(:customer)
         expect(@customer.name).to eq(@customer.first_name)
       end
     end
   end
end
