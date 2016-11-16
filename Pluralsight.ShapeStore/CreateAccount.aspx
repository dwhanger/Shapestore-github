<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="Pluralsight.ShapeStore.CreateAccount1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Shape Store :: Create Account</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding: 10px 10px 10px 10px">
        <asp:CreateUserWizard ID="CreateUserWizard1" ContinueDestinationPageUrl="~/Default.aspx" runat="server" DisplayCancelButton="True" OnCreatedUser="CreateUserWizard1_CreatedUser">
            <WizardSteps>
                <asp:WizardStep ID="CreateUserWizardStep1" runat="server">
                    <table>
                        <tr>
                            <th>User Information</th>
                        </tr>
                        <tr>
                            <td>First Name:</td>
                            <td>
                                <asp:TextBox runat="server" ID="FirstName" />
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ControlToValidate="FirstName"
                                    ErrorMessage="First Name is required." />
                            </td>
                        </tr>
                        <tr>
                            <td>Last Name:</td>
                            <td>
                                <asp:TextBox runat="server" ID="LastName" />
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ControlToValidate="LastName"
                                    ErrorMessage="Last Name is required." />
                            </td>
                        </tr>
                        <tr>
                            <td>Mailing Address:</td>
                            <td>
                                <asp:TextBox runat="server" ID="MailingAddress" />
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="MailingAddress"
                                    ErrorMessage="Mailing Address is required." />
                            </td>
                        </tr>
                        <tr>
                            <td>Mailing City:</td>
                            <td>
                                <asp:TextBox runat="server" ID="MailingCity" />
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="MailingCity"
                                    ErrorMessage="Mailing City is required." />
                            </td>
                        </tr>
                        <tr>
                            <td>Mailing State/Province:</td>
                            <td>
                                <asp:TextBox runat="server" ID="MailingState" />
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="MailingState"
                                    ErrorMessage="Mailing State is required." />
                            </td>
                        </tr>
                        <tr>
                            <td>Mailing Postal Code:</td>
                            <td>
                                <asp:TextBox runat="server" ID="MailingPostalCode" />
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="MailingPostalCode"
                                    ErrorMessage="Mailing Postal Code is required." />
                            </td>
                        </tr>
                    </table>
                </asp:WizardStep>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep0" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <th>User Information</th>
                            </tr>
                            <tr>
                                <td>Username:</td>
                                <td>
                                    <asp:TextBox runat="server" ID="UserName" />
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator9" ControlToValidate="UserName"
                                        ErrorMessage="Username is required." />
                                </td>
                            </tr>
                            <tr>
                                <td>Password:</td>
                                <td>
                                    <asp:TextBox runat="server" ID="Password" TextMode="Password" />
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator10" ControlToValidate="Password"
                                        ErrorMessage="Password is required." />
                                </td>
                            </tr>
                            <tr>
                                <td>Confirm Password:</td>
                                <td>
                                    <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" />
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator13" ControlToValidate="ConfirmPassword"
                                        ErrorMessage="Confirm Password is required." />
                                </td>
                            </tr>
                            <tr>
                                <td>Security Question</td>
                                <td>
                                    <asp:TextBox runat="server" ID="Question"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server"
                                        ControlToValidate="Question"
                                        ToolTip="Security Question is a required field."
                                        ID="QuestionRequired"
                                        ValidationGroup="CreateUserWizard1"
                                        ErrorMessage="Security Question is a required field.">*
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>Security Answer:</td>
                                <td>
                                    <asp:TextBox runat="server" ID="Answer"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server"
                                        ControlToValidate="Answer"
                                        ToolTip="Security Answer is a required field."
                                        ID="AnswerRequired"
                                        ValidationGroup="CreateUserWizard1"
                                        ErrorMessage="Security Answer is a required field.">*
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr>
                                <td>Email:</td>
                                <td>
                                    <asp:TextBox runat="server" ID="Email" />
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator11" ControlToValidate="Email"
                                        ErrorMessage="Email is required." />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                        ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."></asp:CompareValidator>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                </asp:CompleteWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard>
    </div>
</asp:Content>
