require 'fakeit/openapi/specification'

describe Fakeit::Openapi::Specification do
  let(:doc) { double(OpenAPIParser::Schemas::OpenAPI) }
  let(:request_operation) { double(OpenAPIParser::RequestOperation) }
  let(:operation) { double(Fakeit::Openapi::Operation) }

  let(:method) { :get }
  let(:path) { '/' }

  subject { Fakeit::Openapi::Specification.new(doc) }

  it 'gets operation' do
    allow(doc).to receive(:request_operation).with(method, path).and_return(request_operation)
    allow(Fakeit::Openapi::Operation).to receive(:new).with(request_operation).and_return(operation)

    expect(subject.operation(method, path)).to be(operation)
  end
end