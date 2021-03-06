# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SolidusAffirmV2::CallbackHook::Base do
  let(:order) { create(:order_with_totals, state: order_state) }
  let(:order_state) { "payment" }
  let(:payment_method) { create(:affirm_v2_payment_method) }
  let(:checkout_token) { "26VJRAAYE0MB0V25" }
  let(:affirm_payment_source) { create(:affirm_v2_transaction, transaction_id: checkout_token) }

  let(:payment) do
    create(
      :payment,
      response_code: nil,
      order: order,
      source: affirm_payment_source,
      payment_method: payment_method
    )
  end

  subject { SolidusAffirmV2::CallbackHook::Base.new }

  describe "authorize!" do
    context "with a valid payment setup" do
      xit "will set the payment amount to the affirm amount" do
      end

      xit "will set the affirm transaction id as the response_code on the payment" do
      end

      context "when order state is payment" do
        xit "moves the order to the next state" do
        end
      end

      context "when order state is not payment" do
        let(:order_state) { "confirm" }

        xit "doesn't raise a StateMachines::InvalidTransition exception" do
        end
      end
    end
  end
end
