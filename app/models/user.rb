# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  email             :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  password_digest   :string(255)
#  remember_digest   :string(255)
#  admin             :boolean          default(FALSE)
#  activation_digest :string(255)
#  activated         :boolean          default(FALSE)
#  activated_at      :datetime
#  reset_digest      :string(255)
#  reset_sent_at     :datetime
#  first_name        :string(255)
#  last_name         :string(255)
#  profile_type      :string(255)
#  profile_id        :string(255)
#  role              :string(255)
#
# Indexes
#
#  index_users_on_email                        (email) UNIQUE
#  index_users_on_profile_id_and_profile_type  (profile_id,profile_type)
#

class User < ActiveRecord::Base
  belongs_to :profile, polymorphic: true
  has_many :job_orders, through: :profile
  has_many :orders, -> { where active: true }, class_name: "JobOrder", foreign_key: "acct_manager_id"
  has_many :accounts, :through => :orders, :source => :company_profile
  
  # has_many :assignments, :through => :profile, :source => :profile, :source_type => "EmployeeProfile"
  # has_many :timesheets, :through => :assignments
  # belongs_to :agency_profile, -> { where profile_type: 'AgencyProfile' }, class_name: "User", foreign_key: "profile_id"
  # belongs_to :company_profile, -> { where profile_type: 'CompanyProfile' }, class_name: "User", foreign_key: "profile_id"
  # belongs_to :agency_profile,  :class_name => "AgencyProfile",
  #                       :foreign_key => "profile_id"
  # belongs_to :company_profile,     :class_name => "CompanyProfile",
  #                       :foreign_key => "profile_id"
  # belongs_to :agency_profile, :class_name => profile_type, :foreign_key => 'id'

  # has_one :self_ref, :class_name => self, :foreign_key => :id

  # has_one :agency_profile, :through => :self_ref, :source => :profile, :source_type => AgencyProfile
  # has_one :company_profile, :through => :self_ref, :source => :profile, :source_type => CompanyProfile
  # has_one :employee_profile, :through => :self_ref, :source => :profile, :source_type => EmployeeProfile
  delegate :job_orders, to: :profile
  delegate :assignments, to: :profile
  delegate :timesheets, to: :profile
 
  attr_accessor :new_agency_name
  before_save :create_agency_from_name

  accepts_nested_attributes_for :profile
  attr_accessor :remember_token, :activation_token, :reset_token
  
  before_save   :downcase_email
  before_create :create_activation_digest, :set_employee_profile

  validates :first_name,  presence: true, length: { maximum: 50 }
  validates :last_name,  presence: true, length: { maximum: 50 }
  validates :role,  presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
                  
    
  has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true
  
  scope :admins, -> { where("admin = ?", true)}
  # scope :agency, -> { where("role = ?", "agency")}
  # scope :company, -> { where("role = ?", "company")}
  scope :employee_users, -> { where("profile_type = ?", "EmployeeProfile")}
  scope :agency_users, -> { where("profile_type = ?", "AgencyProfile")}
  scope :company_users, -> { where("profile_type = ?", "CompanyProfile")}
  scope :supers, -> { where("role = ?", "super")}
  scope :account_managers, -> { where(role: "Account Manager", profile_type: "AgencyProfile")}
  
  def profile?
    if self.profile != nil
      true
    else
      false
    end
  end
  
  def has_role?(role_sym)
    role.downcase.squish.downcase.tr(" ","_").to_sym == role_sym
  end
  
  
  def super?
    role == "super"
  end
  
  def admin?
    admin == true
  end
  
  def acct_manager?
    self.role == "Account Manager" && self.profile_type == "AgencyProfile"
  end
  
  def agency_owner?
    self.role == "Owner" && self.profile_type == "AgencyProfile"
  end
  
  def agency?
    self.profile_type == "AgencyProfile"
  end
  
  def company?
    profile_type == "CompanyProfile"
  end
  
  def employee?
    profile_type == "EmployeeProfile"
  end
  
  def guest?
    role == "guest"
  end
  
  def create_agency_from_name
    create_profile(:name => new_agency_name) unless new_agency_name.blank?
  end
  
  def create_agency_from_name
    create_profile(:name => new_agency_name) unless new_agency_name.blank?
  end
  def set_employee_profile
    if self.profile_type == "EmployeeProfile"
      profile = EmployeeProfile.create(employee_name: self.name)
      self.profile_type = "EmployeeProfile"
      self.profile_id = profile.id
    end
  end
  
    
  def set_profile_type
    
    if self.role == "company"
      profile = CompanyProfile.create(company_name: self.name)
      self.profile_type = "CompanyProfile"
      self.profile_id = profile.id
    end
    
    if self.role == "employee"
      profile = EmployeeProfile.create(employee_name: self.name)
      self.profile_type = "EmployeeProfile"
      self.profile_id = profile.id
    end
    
    if self.role == "agency"
      profile = AgencyProfile.create(agency_name: self.name)
      self.profile_type = "AgencyProfile"
      self.profile_id = profile.id
    end

  end
  
  # def set_role
  #   self.role = "Unassigned"
  # end
  
  
  # def set_profile
    
  #   if self.role == "company"
  #     profile = CompanyProfile.create(company_name: self.name)
  #     self.profile_type = "CompanyProfile"
  #     self.profile_id = profile.id
  #   end
    
  #   if self.role == "employee"
  #     profile = EmployeeProfile.create(employee_name: self.name)
  #     self.profile_type = "EmployeeProfile"
  #     self.profile_id = profile.id
  #   end
    
  #   if self.role == "agency"
  #     profile = AgencyProfile.create(agency_name: self.name)
  #     self.profile_type = "AgencyProfile"
  #     self.profile_id = profile.id
  #   end

  # end
  
  
  
  
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  def name
   "#{first_name} #{last_name}"
  end
  
    
  
  def User.new_token
    SecureRandom.urlsafe_base64
  end


  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  
 # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  
  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  
  # Activates an account.
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver!
  end
  
  
  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver!
  end
  
  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end
  
  
  
  private
  
      # Converts email to all lower-case.
      def downcase_email
        self.email = email.downcase
      end
  
      # Creates and assigns the activation token and digest.
      def create_activation_digest
        self.activation_token  = User.new_token
        self.activation_digest = User.digest(activation_token)
      end
end
  
